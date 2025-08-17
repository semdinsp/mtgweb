defmodule MtgwebWeb.NewClientFormLiveTest do
  use MtgwebWeb.ConnCase

  import Phoenix.LiveViewTest

  test "New Client Form page loads successfully", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/new-client-form")
    
    # Check that the page renders with expected content
    assert html =~ "New Client Form"
    assert html =~ "MTG Consulting"
    assert html =~ "airtable-embed"
  end

  test "New Client Form page has proper meta tags", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/new-client-form")
    
    # Check SEO meta tags
    assert html =~ "New Client Form | MTG Consulting"
    assert html =~ "Start your journey with MTG Consulting"
  end

  test "New Client Form page contains Airtable iframe", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/new-client-form")
    
    # Check that the Airtable iframe is present
    assert html =~ "https://airtable.com/embed/app62gxxiDB84TQSp/pag2NxNqZ1LATYvzY/form"
    assert html =~ "iframe"
    assert html =~ "airtable-embed"
  end

  test "New Client Form page navigation works", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/new-client-form")
    
    # Ensure the LiveView is responsive
    assert render(view) =~ "New Client Form"
  end

  test "New Client Form page has contact information", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/new-client-form")
    
    # Check that contact information is present
    assert html =~ "info@mtg-consulting.net"
    assert html =~ "24 hours"
  end

  test "New Client Form page has return to home link", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/new-client-form")
    
    # Check that return to home link is present
    assert html =~ "Return to Home"
    assert html =~ "href=\"/\""
  end
end