defmodule MtgwebWeb.AiToolsLiveTest do
  use MtgwebWeb.ConnCase

  import Phoenix.LiveViewTest

  test "AI Tools page loads successfully", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "AI Tools"
    assert html =~ "Small Business"
  end

  test "AI Tools page has proper meta tags", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "AI Tools for Small Business"
    assert html =~ "Expert Financial Management"
  end

  test "AI Tools page displays Gmail integration tool", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "Gmail"
    assert html =~ "Support Request"
  end

  test "AI Tools page displays set-theoretic reporting tool", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "Set-Theoretic"
    assert html =~ "union"
    assert html =~ "intersection"
  end

  test "AI Tools page displays document intelligence tool", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "Document Intelligence"
    assert html =~ "QuickBooks"
  end

  test "AI Tools page displays workflow automation tool", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "Workflow Automation"
  end

  test "AI Tools page has CTA linking to contact", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "href=\"/contact\""
    assert html =~ "consultation" or html =~ "Consultation"
  end

  test "AI Tools page has correct nav link", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/ai-tools")
    assert html =~ "href=\"/ai-tools\""
    assert html =~ "AI Tools"
  end
end
