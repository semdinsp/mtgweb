defmodule MtgwebWeb.PageController do
  use MtgwebWeb, :controller
  # scottt not needed? import MtgwebWeb.Gettext
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def pricing(conn, _params) do
    conn
    |> assign(:page_title, "Pricing - Professional Accounting Services")
    |> assign(:meta_description, "Transparent pricing for professional accounting, bookkeeping, and CFO services. Plans starting at $250/month. No hidden fees. Get started today.")
    |> assign(:og_title, "MTG Consulting Pricing - Accounting & CFO Services")
    |> assign(:og_description, "Professional accounting services with transparent pricing. Basic bookkeeping from $250/month, Enhanced services from $500/month.")
    |> assign(:og_url, "https://mtg-consulting.net/pricing")
    |> render("pricing.html")
  end

  def team(conn, _params) do
    conn
    |> assign(:page_title, "Our Team - Expert Accounting Professionals")
    |> assign(:meta_description, "Meet our expert accounting team. CPA professionals with 20+ years experience in financial management, QuickBooks, and business advisory services.")
    |> assign(:og_title, "MTG Consulting Team - Expert CPAs & Financial Advisors")
    |> assign(:og_description, "Our experienced team of CPAs and financial professionals, led by Michael Grandinetti, former Deloitte partner.")
    |> assign(:og_url, "https://mtg-consulting.net/team")
    |> render("team.html")
  end

  def bio(conn, _params) do
    # mike's bio
    render(conn, "bio.html")
  end

  def terms(conn, _params) do
    conn
    |> assign(:page_title, "Terms of Service - MTG Consulting")
    |> assign(:meta_description, "Terms of service and engagement terms for MTG Consulting professional accounting and financial services.")
    |> assign(:og_title, "MTG Consulting Terms of Service")
    |> assign(:og_description, "Review our terms of service and engagement terms for professional accounting services.")
    |> assign(:og_url, "https://mtg-consulting.net/terms")
    |> render("terms.html")
  end

  def contact(conn, _params) do
    conn
    |> assign(:page_title, "Contact Us - Professional Accounting Services")
    |> assign(:meta_description, "Contact MTG Consulting for professional accounting, bookkeeping, and CFO services. Call (503) 931-4045 or email michael@mtg-consulting.net for a free consultation.")
    |> assign(:og_title, "Contact MTG Consulting - Professional Accounting Services")
    |> assign(:og_description, "Get in touch with our accounting professionals for a free consultation. Expert financial management services for your business.")
    |> assign(:og_url, "https://mtg-consulting.net/contact")
    |> render("contact.html")
  end

  def contactpricing(conn, _params) do
    render(conn, "contactpricing.html")
  end

  def contactconsult(conn, _params) do
    render(conn, "contactconsult.html")
  end
end
