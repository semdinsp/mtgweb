defmodule MtgwebWeb.PageController do
  use MtgwebWeb, :controller
  # scottt not needed? import MtgwebWeb.Gettext
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def pricing(conn, _params) do
    conn
    |> assign(:page_title, "Small Business Accounting Cost | CPA Services Pricing | QuickBooks")
    |> assign(:meta_description, "Small business accounting cost from $250/month. Transparent CPA services pricing for QuickBooks consulting, bookkeeping, and CFO services. No hidden fees.")
    |> assign(:og_title, "Small Business Accounting Cost | CPA Services Pricing")
    |> assign(:og_description, "Small business accounting cost from $250/month. Transparent CPA services pricing for QuickBooks consulting and bookkeeping.")
    |> assign(:og_url, "https://mtg-consulting.net/pricing")
    |> render("pricing.html")
  end

  def team(conn, _params) do
    conn
    |> assign(:page_title, "CPA Team | Small Business QuickBooks Experts | Certified Accountants")
    |> assign(:meta_description, "Expert CPA team specializing in small business accounting and QuickBooks consulting. Certified accountants with 20+ years experience in financial management.")
    |> assign(:og_title, "CPA Team | Small Business QuickBooks Experts")
    |> assign(:og_description, "Expert CPA team specializing in small business accounting and QuickBooks consulting. Led by Michael Grandinetti, former Deloitte partner.")
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
    |> assign(:page_title, "Free CPA Consultation | Small Business QuickBooks Help | Contact MTG")
    |> assign(:meta_description, "Free CPA consultation for small businesses. Get expert QuickBooks help and accounting advice. Call (503) 931-4045 or email for your free consultation today.")
    |> assign(:og_title, "Free CPA Consultation | Small Business QuickBooks Help")
    |> assign(:og_description, "Free CPA consultation for small businesses. Get expert QuickBooks help and accounting advice from certified professionals.")
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
