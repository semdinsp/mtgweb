defmodule MtgwebWeb.SitemapController do
  use MtgwebWeb, :controller

  def index(conn, _params) do
    urls = [
      %{
        loc: "https://mtg-consulting.net/",
        lastmod: Date.utc_today(),
        changefreq: "weekly",
        priority: 1.0
      },
      %{
        loc: "https://mtg-consulting.net/pricing", 
        lastmod: Date.utc_today(),
        changefreq: "monthly",
        priority: 0.9
      },
      %{
        loc: "https://mtg-consulting.net/team",
        lastmod: Date.utc_today(),
        changefreq: "monthly", 
        priority: 0.8
      },
      %{
        loc: "https://mtg-consulting.net/articles",
        lastmod: Date.utc_today(),
        changefreq: "weekly",
        priority: 0.7
      },
      %{
        loc: "https://mtg-consulting.net/contact",
        lastmod: Date.utc_today(),
        changefreq: "yearly",
        priority: 0.6
      },
      %{
        loc: "https://mtg-consulting.net/terms",
        lastmod: Date.utc_today(),
        changefreq: "yearly",
        priority: 0.3
      }
    ]
    
    conn
    |> put_resp_content_type("application/xml")
    |> render("sitemap.xml", urls: urls)
  end
end