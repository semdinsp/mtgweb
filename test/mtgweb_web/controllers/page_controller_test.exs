defmodule MtgwebWeb.PageControllerTest do
  use MtgwebWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "MTG Consulting"
  end
end
