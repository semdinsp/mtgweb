defmodule MtgwebWeb.PageControllerTest do
  use MtgwebWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "MTG Consulting"
  end

  test "GET /pricing", %{conn: conn} do
    conn = get(conn, "/pricing")
    assert html_response(conn, 200) =~ "The all-in-one financial team"
  end

  test "GET /team", %{conn: conn} do
    conn = get(conn, "/team")
    assert html_response(conn, 200) =~ "Meet our team:"
  end

  test "GET /bio", %{conn: conn} do
    conn = get(conn, "/bio")
    assert html_response(conn, 200) =~ "Michael Grandinetti"
  end

  test "GET /contact", %{conn: conn} do
    conn = get(conn, "/contact")
    assert html_response(conn, 200) =~ "airtable-embed"
  end
end
