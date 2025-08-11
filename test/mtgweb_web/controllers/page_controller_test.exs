defmodule MtgwebWeb.PageControllerTest do
  use MtgwebWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "MTG Consulting"
  end

  describe "Pricing page" do
    test "GET /pricing", %{conn: conn} do
      conn = get(conn, "/pricing")
      response = html_response(conn, 200)
      assert response =~ "The all-in-one financial team"
    end

    test "pricing page has proper SEO meta tags", %{conn: conn} do
      conn = get(conn, "/pricing")
      response = html_response(conn, 200)
      
      assert response =~ "Small Business Accounting Cost"
      assert response =~ "CPA Services Pricing"
      assert response =~ "QuickBooks"
      assert response =~ "$250/month"
    end

    test "pricing page has pricing information", %{conn: conn} do
      conn = get(conn, "/pricing")
      response = html_response(conn, 200)
      
      assert response =~ "$250" or response =~ "250"
      assert response =~ "Basic Bookkeeping"
      assert response =~ "Enhanced Bookkeeping"
      assert response =~ "Comprehensive Bookkeeping"
    end

    test "pricing page displays price information", %{conn: conn} do
      conn = get(conn, "/pricing")
      response = html_response(conn, 200)
      
      assert response =~ "$250"
      assert response =~ "$500"
      assert response =~ "$995"
    end
  end

  describe "Our Team page" do
    test "GET /team", %{conn: conn} do
      conn = get(conn, "/team")
      response = html_response(conn, 200)
      assert response =~ "Meet Our"
    end

    test "team page has proper SEO meta tags", %{conn: conn} do
      conn = get(conn, "/team")
      response = html_response(conn, 200)
      
      assert response =~ "CPA Team"
      assert response =~ "Small Business QuickBooks Experts"
      assert response =~ "Certified Accountants"
      assert response =~ "20+ years experience"
    end

    test "team page displays team member information", %{conn: conn} do
      conn = get(conn, "/team")
      response = html_response(conn, 200)
      
      assert response =~ "Michael Grandinetti"
      assert response =~ "CPA"
      assert response =~ "Account Management"
    end

    test "team page has social links with proper styling", %{conn: conn} do
      conn = get(conn, "/team")
      response = html_response(conn, 200)
      
      # Check for orange color styling mentioned in the requirements
      assert response =~ "rgb(255, 127, 8)" or response =~ "orange"
    end
  end

  test "GET /bio", %{conn: conn} do
    conn = get(conn, "/bio")
    assert html_response(conn, 200) =~ "Michael Grandinetti"
  end

  describe "Contact Us page" do
    test "GET /contact", %{conn: conn} do
      conn = get(conn, "/contact")
      response = html_response(conn, 200)
      assert response =~ "airtable-embed"
    end

    test "contact page has proper SEO meta tags", %{conn: conn} do
      conn = get(conn, "/contact")
      response = html_response(conn, 200)
      
      assert response =~ "Free CPA Consultation"
      assert response =~ "Small Business QuickBooks Help"
      assert response =~ "Contact MTG"
      assert response =~ "(503) 931-4045"
    end

    test "contact page displays contact form", %{conn: conn} do
      conn = get(conn, "/contact")
      response = html_response(conn, 200)
      
      assert response =~ "airtable-embed"
      assert response =~ "airtable.com"
    end

    test "contact page has consultation call-to-action", %{conn: conn} do
      conn = get(conn, "/contact")
      response = html_response(conn, 200)
      
      assert response =~ "consultation" or response =~ "Free"
    end
  end

  describe "Page consistency checks" do
    test "all pages load successfully", %{conn: conn} do
      pages = ["/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        assert html_response(conn, 200)
      end
    end

    test "all pages have proper purple background styling", %{conn: conn} do
      pages = ["/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check for purple background mentioned in design requirements
        assert response =~ "rgb(29, 9, 89)" or response =~ "bg-primary-purple"
      end
    end

    test "all pages have footer information", %{conn: conn} do
      pages = ["/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "MTG Consulting"
        assert response =~ "2025"
      end
    end
  end
end
