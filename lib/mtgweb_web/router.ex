defmodule MtgwebWeb.Router do
  use MtgwebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MtgwebWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MtgwebWeb do
    pipe_through :browser
    live "/", PageLive
    live "/articles", ArticlesLive

    # 301 redirects from the old CMS-id article URLs to the new clean
    # /services/* paths. Must be declared before the dynamic
    # /articles/:id/:slug route below, or that catch-all would shadow
    # these literal matches and the redirects would never fire.
    get "/articles/recMxe21SA4xycNka/sw-dev", RedirectController, :system_integration
    get "/articles/recTwyAJRgHMAsHWd/bank-financing", RedirectController, :bank_financing
    get "/articles/recaNeEc64Wq6kx0J/book-keeping-svcs", RedirectController, :bookkeeping
    get "/articles/recoZ4edVdxsIIlT0/clients", RedirectController, :clients

    live "/articles/:id/:slug", ShowArticleLive

    # Clean, descriptive URLs for the four service pages (CMS-backed via
    # ShowArticleLive, same as /articles/:id/:slug, but with a stable,
    # human-readable path instead of the raw Airtable record id).
    live "/services/system-integration", ShowArticleLive, :system_integration
    live "/services/bank-financing", ShowArticleLive, :bank_financing
    live "/services/bookkeeping", ShowArticleLive, :bookkeeping
    live "/services/clients", ShowArticleLive, :clients

    live "/ai-tools", AiToolsLive
    live "/new-client-form", NewClientFormLive
    get "/pricing", PageController, :pricing
    get "/contact", PageController, :contact
    get "/contactpricing", PageController, :contactpricing
    get "/contactconsult", PageController, :contactconsult

    get "/team", PageController, :team
    get "/bio", RedirectController, :bio_to_team
    get "/terms", PageController, :terms
    get "/engagement", PageController, :engagement
    get "/amazon-seller-bookkeeping", PageController, :amazon_seller_bookkeeping
    
    # SEO Routes
    get "/sitemap.xml", SitemapController, :index

    # SCOTT get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MtgwebWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MtgwebWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
