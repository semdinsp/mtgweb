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
  def contact(conn, _params) do
    render(conn, "contact.html")
  end
end
