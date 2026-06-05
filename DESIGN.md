# DESIGN.md — MTG Consulting Website Design System

> **Before making any visual or styling changes to the website, read this file first.**
> It is the authoritative reference for colors, typography, components, and patterns.

---

## Tech Stack

| Tool | Role |
|------|------|
| **Tailwind CSS v4** | Utility-first styling |
| **DaisyUI v5** | Pre-built component library (custom "mtg" theme) |
| **Alpine.js v3** | Lightweight JS interactivity (dropdowns, toggles, counters) |
| **Poppins / Source Sans Pro** | Web fonts (Google Fonts) |

> Note: The project does **not** use Semantic UI. DaisyUI is the component library layered on top of Tailwind.

---

## Color Palette

All colors are defined in `tailwind.config.js` under the `mtg` key and mapped into the DaisyUI "mtg" theme.

### Core Colors

| Name | Value | Usage |
|------|-------|-------|
| **MTG Purple** | `rgb(29, 9, 89)` | Primary page background, base card background |
| **MTG Purple Dark** | `rgb(24, 7, 74)` | Card backgrounds, secondary surfaces, DaisyUI `base-200` |
| **MTG Purple Darkest** | `rgb(19, 5, 59)` | Deepest surface level, DaisyUI `base-300` |
| **MTG Orange** | `rgb(255, 127, 8)` | Buttons, icons, accents, hover states, highlights |
| **Orange Focus** | `rgb(230, 102, 0)` | Orange hover/focus state |
| **White** | `rgb(255, 255, 255)` | All body text, headings |
| **Near-Black** | `rgb(5, 5, 5)` | Neutral/dark DaisyUI token |

### Tailwind Custom Color Tokens

```js
// tailwind.config.js
colors: {
  'mtg': {
    'purple': 'rgb(29, 9, 89)',
    'orange': 'rgb(255, 127, 8)',
    'white':  'rgb(255, 255, 255)',
    'dark':   'rgb(5, 5, 5)',
  },
  'brand': 'rgb(29, 9, 89)',
}
```

### DaisyUI Theme Tokens (theme: "mtg")

```js
"primary":          "rgb(29, 9, 89)"     // deep purple
"primary-focus":    "rgb(24, 7, 74)"
"primary-content":  "rgb(255, 255, 255)"
"secondary":        "rgb(255, 127, 8)"   // orange
"secondary-focus":  "rgb(230, 102, 0)"
"accent":           "rgb(255, 127, 8)"   // also orange
"base-100":         "rgb(29, 9, 89)"
"base-200":         "rgb(24, 7, 74)"
"base-300":         "rgb(19, 5, 59)"
"base-content":     "rgb(255, 255, 255)"
"surface" / "card": "rgb(24, 7, 74)"
```

### Color Usage Rules

- **Never** use a white or light background — all pages use purple.
- Use `rgb(24, 7, 74)` (not the primary purple) for cards to create visual separation.
- Inline `style=` attributes are sometimes used for backgrounds to ensure specificity over Tailwind resets (e.g. `style="background-color: rgb(29, 9, 89) !important"`).
- Orange (`rgb(255, 127, 8)`) is the sole accent — used for borders, icons, CTAs, hover states, checkmarks, and gradient dividers.
- Opacity variants of white (`text-white/75`, `text-white/70`, `text-white/65`) create visual hierarchy within white text.
- Opacity variants of orange (`border-orange-500/30`, `bg-orange-500/20`) create subtle accent surfaces.

---

## Typography

### Font Families

| Role | Font | Fallbacks |
|------|------|-----------|
| **Headings** | Poppins | system-ui, sans-serif |
| **Body / paragraphs** | Source Sans Pro | system-ui, sans-serif |
| **Tailwind `font-sans`** | Inter, Inter Tight | system-ui, sans-serif |
| **Tailwind `font-display`** | Inter Display | Inter, system-ui |
| **Tailwind `font-serif`** | Playfair Display | Georgia, serif |

Fonts are loaded from Google Fonts in `app.css`:
```css
@import url('https://fonts.googleapis.com/css2?family=Poppins:...&family=Source+Sans+Pro:...&display=swap');
```

### Font Size Overrides

These classes are **overridden** in `app.css` — do not assume default Tailwind sizes:

| Class | Actual size | Default Tailwind |
|-------|-------------|-----------------|
| `.text-sm` | `1.0rem` | `0.875rem` |
| `.text-xl` | `1.5rem` | `1.25rem` |
| `.text-2xl` | `1.75rem` | `1.5rem` |
| `.trust-indicator` | `1.0625rem` | (custom) |

### Font Rendering

All elements use antialiased font smoothing:
```css
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
text-rendering: optimizeLegibility;
```

### Typography Rules

- Headings: `font-bold` or `font-semibold`, `tracking-tight`, `leading-tight`
- Navigation: `font-medium`, `text-lg` (18px), Poppins
- Labels / tags: `font-medium`, `text-sm` or `text-xs`
- Body: `font-normal`, `leading-relaxed`
- Letter-spacing on headings: `-0.025em`

---

## Global Styles

Set in `app.css` at the root level:

```css
html, body {
  background-color: rgb(29, 9, 89) !important;
  color: rgb(255, 255, 255);
}

a           { color: white; }
a:hover     { color: rgb(255, 127, 8); }
nav a       { color: white; text-decoration: none; }
nav a:hover { color: rgb(255, 127, 8); transition: color 0.2s ease; }
```

---

## Custom CSS Classes

Defined in `app.css` under `@layer components`:

### `.mtg-button`
Primary CTA button style.
```css
@apply bg-orange-400 text-white hover:text-orange-400 px-6 py-3 rounded-lg font-semibold
       transition-all duration-200 transform hover:scale-105;
```

### `.mtg-nav-link`
Navigation link style.
```css
@apply text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md;
font-family: Poppins; font-weight: 500; font-size: 1.125rem;
```

### `.mtg-card`
Card container.
```css
background-color: mtg-purple;
@apply text-white rounded-lg p-6 shadow-lg hover:shadow-xl transition-all duration-200;
```

### `.mtg-background`
Page section background.
```css
background-color: mtg-purple;
@apply text-white;
```

### `.btn-scott`
Utility button (legacy/dev use).
```css
@apply py-2 px-4 bg-zinc-500 text-white font-semibold rounded-lg;
```

---

## Buttons

### Primary CTA Button (gradient orange)
Used on pricing cards and hero sections.
```html
<a href="/path"
   class="text-white bg-gradient-to-r from-orange-500 to-orange-600
          hover:from-orange-600 hover:to-orange-700
          font-medium text-md px-5 py-2.5 text-center
          transition-all duration-200">
  Get started
</a>
```

### DaisyUI Button
Used for interactive elements (Alpine.js, forms).
```html
<button class="btn btn-primary">Label</button>
<button class="btn btn-secondary">Label</button>
```
DaisyUI `btn-primary` resolves to the purple theme; `btn-secondary` resolves to orange.

### Custom `.mtg-button`
```html
<a href="/path" class="mtg-button">Learn More</a>
```

---

## Cards

### Standard Pricing / Feature Card
```html
<div class="flex flex-col p-6 rounded-2xl border-2 border-orange-400 text-white shadow"
     style="background-color: rgb(29, 9, 89) !important;">
  <h3 class="text-2xl font-semibold mb-4 text-white">Title</h3>
  <p class="text-white/75">Supporting text...</p>
  <hr class="border-t border-orange-400 my-3">
  <!-- content -->
  <a href="#" class="text-white bg-gradient-to-r from-orange-500 to-orange-600
                     hover:from-orange-600 hover:to-orange-700
                     px-5 py-2.5 rounded font-medium text-center transition-all">
    CTA
  </a>
</div>
```

### Tool / Project Card (darker background, softer border)
```html
<div class="rounded-2xl p-8 border border-orange-500/30 hover:border-orange-500/60
            transition-colors duration-200"
     style="background: rgb(24, 7, 74);">
  <!-- content -->
</div>
```

### Card with Icon Header
```html
<div class="flex items-start gap-4 mb-6">
  <div class="shrink-0 w-12 h-12 rounded-xl flex items-center justify-center"
       style="background: rgb(255, 127, 8);">
    <svg class="w-6 h-6 text-white"><!-- icon --></svg>
  </div>
  <div>
    <h3 class="text-xl font-bold text-white mb-1">Feature Name</h3>
    <span class="text-sm font-medium" style="color: rgb(255, 127, 8);">Category</span>
  </div>
</div>
```

---

## Feature / Checklist Lists

```html
<ul class="space-y-4">
  <li class="flex items-center space-x-3">
    <svg class="flex-shrink-0 w-5 h-5 text-orange-400" fill="currentColor">
      <!-- checkmark path -->
    </svg>
    <span class="text-white">Feature description</span>
  </li>
</ul>
```

---

## Tags / Badges

Small inline labels for categories or tech tags:
```html
<span class="px-2 py-1 rounded-md text-xs font-medium text-white/80"
      style="background: rgba(255,127,8,0.2);">
  Tag Label
</span>
```

---

## Dividers / Section Accents

### Orange gradient pill divider
```html
<div class="flex justify-center">
  <div class="w-24 h-1 bg-gradient-to-r from-orange-400 to-orange-500 rounded-full"></div>
</div>
```

### Orange horizontal rule (inside cards)
```html
<hr class="h-[1px] border-t border-orange-400 my-[10px]">
```

---

## Animations

Defined in `app.css` as `@keyframes` and applied via class:

| Class | Effect |
|-------|--------|
| `.fade-in-scale` | 0.2s ease-in, scale 0.95→1, opacity 0→1 |
| `.fade-out-scale` | 0.2s ease-out, scale 1→0.95, opacity 1→0 |
| `.fade-in` | 0.2s ease-out, opacity 0→1 |
| `.fade-out` | 0.2s ease-out, opacity 1→0 |

Interactive hover transitions use `transition-all duration-200` (200ms).

---

## Alpine.js Patterns

### Dropdown
```html
<div x-data="{ open: false }" class="relative">
  <button @click="open = !open"
          @keydown.escape.window="open = false"
          @click.away="open = false">
    Toggle
  </button>
  <div x-cloak x-show="open"
       x-transition:enter="transition ease-out duration-100"
       x-transition:enter-start="transform opacity-0 scale-95"
       x-transition:enter-end="transform opacity-100 scale-100"
       x-transition:leave="transition ease-in duration-75"
       x-transition:leave-start="transform opacity-100 scale-100"
       x-transition:leave-end="transform opacity-0 scale-95">
    <!-- dropdown content -->
  </div>
</div>
```

---

## Hero Sections

```html
<div class="min-h-screen" style="background: rgb(29, 9, 89);">
  <h1 class="text-5xl md:text-6xl lg:text-7xl font-bold tracking-tight leading-tight text-white">
    Heading text
    <span class="bg-gradient-to-r from-orange-400 to-orange-500 bg-clip-text text-transparent">
      Orange gradient word
    </span>
  </h1>
</div>
```

---

## Responsive Patterns

- Mobile-first: base styles for mobile, `md:` / `lg:` for larger screens
- Card grids: `grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6`
- Hero text scaling: `text-4xl md:text-5xl lg:text-7xl`
- Card widths: fixed `w-[388px]` on pricing cards (centered with `mx-auto`)

---

## Do's and Don'ts

**Do:**
- Use `rgb(24, 7, 74)` for card backgrounds so they stand out from the `rgb(29, 9, 89)` page background
- Use orange (`rgb(255, 127, 8)` / `orange-400` / `orange-500`) as the only accent color
- Apply `transition-all duration-200` to interactive elements
- Use `text-white/75` or `text-white/70` for secondary text (creates hierarchy without color change)
- Use `rounded-2xl` for cards and `rounded-lg` or `rounded-xl` for buttons and icons

**Don't:**
- Don't use light or white backgrounds anywhere on the page
- Don't introduce new accent colors — orange is the only one
- Don't use Semantic UI — this project uses DaisyUI
- Don't assume default Tailwind font sizes; `.text-sm`, `.text-xl`, `.text-2xl` are all overridden
- Don't add new Google Fonts without updating `app.css` imports
