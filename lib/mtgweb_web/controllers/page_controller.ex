defmodule MtgwebWeb.PageController do
  use MtgwebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def pricing(conn, _params) do
    render(conn, "pricing.html")
  end

  def team(conn, _params) do
    render(conn, "team.html")
  end

  def bio(conn, _params) do
    # mike's bio
    render(conn, "bio.html")
  end

  def terms(conn, _params) do
    # mike's bio
    render(conn, "terms.html")
  end

  def contact(conn, _params) do
    render(conn, "contact.html")
  end
  def contactpricing(conn, _params) do
    render(conn, "contactpricing.html")
  end
end
