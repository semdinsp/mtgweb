defmodule MtgwebWeb.PageController do
  use MtgwebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
