defmodule MtgwebWeb.ArticlesLiveTest do
  use MtgwebWeb.ConnCase

  import Phoenix.LiveViewTest

  test "Our Services page loads successfully", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/articles")
    
    # Check that the page renders with expected content
    assert html =~ "services"
    assert html =~ "MTG"
  end

  test "Our Services page has proper meta tags", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/articles")
    
    # Check SEO meta tags
    assert html =~ "Small Business Accounting Services"
    assert html =~ "CPA &amp; QuickBooks Solutions"
    assert html =~ "Expert small business accounting services"
  end

  test "Our Services page navigation works", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/articles")
    
    # Ensure the LiveView is responsive
    assert render(view) =~ "services"
  end
end