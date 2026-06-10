# Security TODO

Items from the June 2026 security review that still need attention.
The three items marked DONE below were fixed on 2026-06-09.

---

## DONE ✅

- **XSS via raw Markdown** — `show_article_live.html.leex:33`
  Added `HtmlSanitizeEx.markdown_html/1` sanitization step before `raw/1`.

- **Airtable PAT logged in plaintext** — `lib/services/airtable.ex:12`
  Added `filter_headers: ["authorization"]` to `Tesla.Middleware.Logger`.

- **HSTS not enabled** — `config/prod.exs:18`
  Added `hsts: true` to `force_ssl` config.

---

## TODO

### 🔴 Strip credentials from git history
The old Airtable PAT (`patkNHYbXLNH3BByc...`) and API key (`keyN7kPZVO7gOoIS4`)
are permanently in git history. Credentials have already been rotated, but the
history should be cleaned so they cannot be extracted from old commits.

**Steps:**
1. Install `git-filter-repo` (preferred over BFG):
   ```
   brew install git-filter-repo
   ```
2. Remove the secrets from history:
   ```
   git filter-repo --replace-text <(echo "patkNHYbXLNH3BByc.7dce0b8a1bf49208f8a82fc8b7f7c99a2c982b2e89d7457cc3522d0d98f44286==>REDACTED_PAT")
   git filter-repo --replace-text <(echo "keyN7kPZVO7gOoIS4==>REDACTED_API_KEY")
   ```
3. Force-push the rewritten history:
   ```
   git push origin main --force
   ```
4. Ask GitHub support to purge cached views of the old commits:
   https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

**Warning:** This rewrites all commit SHAs. Anyone with a local clone will need
to re-clone. Coordinate with any other contributors before doing this.

---

### 🟡 Harden session and LiveView signing salts
**Files:** `config/config.exs:18`, `lib/mtgweb_web/endpoint.ex:10`

The LiveView signing salt and session cookie salt are short (8-character) static
strings committed to the repo. They should be rotated and moved to env vars.

**Steps:**
1. Generate two new 32-character salts:
   ```
   mix phx.gen.secret 32   # run twice
   ```
2. Add them to your Fly.io secrets:
   ```
   fly secrets set LIVE_VIEW_SALT="<new-salt-1>"
   fly secrets set SESSION_SALT="<new-salt-2>"
   ```
3. Update `config/config.exs` to read from env:
   ```elixir
   live_view: [signing_salt: System.fetch_env!("LIVE_VIEW_SALT")]
   ```
4. Update `lib/mtgweb_web/endpoint.ex` session config similarly.
5. Move these reads to `runtime.exs` so they are resolved at runtime, not
   compile time.

---

### 🟡 Add SRI hash to Alpine.js CDN script tag
**File:** Layout template (the `<script>` tag loading Alpine.js from `unpkg.com`)

Alpine.js is loaded from an external CDN with no `integrity` attribute. If the
CDN is compromised, malicious JS would execute on every page.

**Steps:**
1. Download the specific Alpine.js version being used:
   ```
   curl -o alpinejs.min.js https://unpkg.com/alpinejs@3.14.9/dist/cdn.min.js
   ```
2. Generate the SRI hash:
   ```
   openssl dgst -sha384 -binary alpinejs.min.js | openssl base64 -A
   ```
3. Add `integrity` and `crossorigin` attributes to the script tag:
   ```html
   <script
     defer
     src="https://unpkg.com/alpinejs@3.14.9/dist/cdn.min.js"
     integrity="sha384-<hash-from-step-2>"
     crossorigin="anonymous">
   </script>
   ```
4. Or better: copy `alpinejs.min.js` into `assets/vendor/` and load it locally,
   eliminating the CDN dependency entirely.

---

### 🟡 Add a Content Security Policy (CSP)
**File:** `lib/mtgweb_web/router.ex`

Phoenix's default CSP is only `frame-ancestors 'self'`. A proper CSP would
significantly reduce the blast radius of any future XSS.

**Suggested starting policy** (add to the `:browser` pipeline):
```elixir
plug :put_secure_browser_headers, %{
  "content-security-policy" =>
    "default-src 'self'; " <>
    "script-src 'self' https://unpkg.com 'nonce-{nonce}'; " <>
    "frame-src https://airtable.com; " <>
    "connect-src 'self'; " <>
    "img-src 'self' data: https://dl.airtable.com; " <>
    "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; " <>
    "font-src 'self' https://fonts.gstatic.com"
}
```
Note: LiveView requires `'unsafe-eval'` or nonce-based CSP for its JS.
See https://hexdocs.pm/phoenix_live_view/security-model.html for guidance.
