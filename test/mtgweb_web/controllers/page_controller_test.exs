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
      assert response =~ "Our Team"
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
      assert response =~ "Managing Partner"
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

  describe "Navigation and Footer Links" do
    test "all navigation menu links work correctly", %{conn: conn} do
      # Test main navigation links
      navigation_links = [
        {"Home", "/"},
        {"Our Services", "/articles"},
        {"Pricing", "/pricing"},
        {"Our Team", "/team"},
        {"Contact Us", "/contact"},
        {"Learn More", "/articles"}
      ]
      
      for {_link_text, path} <- navigation_links do
        conn = get(conn, path)
        assert html_response(conn, 200), "Navigation link #{path} should load successfully"
      end
    end

    test "all footer links work correctly", %{conn: conn} do
      # Test footer links
      footer_links = [
        {"Engagement Terms", "/engagement"}
      ]
      
      for {_link_text, path} <- footer_links do
        conn = get(conn, path)
        assert html_response(conn, 200), "Footer link #{path} should load successfully"
      end
    end

    test "homepage contains all navigation links", %{conn: conn} do
      conn = get(conn, "/")
      response = html_response(conn, 200)
      
      # Check that navigation links are present in HTML
      assert response =~ "href=\"/\""
      assert response =~ "href=\"/articles\""
      assert response =~ "href=\"/pricing\""
      assert response =~ "href=\"/team\""
      assert response =~ "href=\"/contact\""
    end

    test "all pages contain navigation menu", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact", "/articles"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check for navigation elements
        assert response =~ "Home", "Page #{page} should contain Home navigation link"
        assert response =~ "Our Services" or response =~ "Services", "Page #{page} should contain Services navigation"
        assert response =~ "Pricing", "Page #{page} should contain Pricing navigation link"
        assert response =~ "Our Team" or response =~ "Team", "Page #{page} should contain Team navigation link"
        assert response =~ "Contact", "Page #{page} should contain Contact navigation link"
      end
    end

    test "footer contains required links and information", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check footer content
        assert response =~ "MTG Consulting", "Page #{page} should contain company name in footer"
        assert response =~ "2025", "Page #{page} should contain copyright year"
        assert response =~ "Engagement Terms", "Page #{page} should contain engagement terms link"
        assert response =~ "michael@mtg-consulting.net", "Page #{page} should contain email contact"
      end
    end
  end

  describe "Homepage Content Tests" do
    test "homepage displays Quality|Value|Service section", %{conn: conn} do
      conn = get(conn, "/")
      response = html_response(conn, 200)
      
      assert response =~ "Quality"
      assert response =~ "Value"
      assert response =~ "Service"
      
      # Check for orange icons (should contain SVG elements)
      assert response =~ "<svg"
      assert response =~ "orange"
    end

    test "homepage displays pricing preview section", %{conn: conn} do
      conn = get(conn, "/")
      response = html_response(conn, 200)
      
      assert response =~ "Transparent Pricing"
      assert response =~ "Basic Bookkeeping"
      assert response =~ "Enhanced Bookkeeping"
      assert response =~ "Comprehensive"
      assert response =~ "$250"
      assert response =~ "$500"
      assert response =~ "$995"
    end

    test "homepage displays services overview section", %{conn: conn} do
      conn = get(conn, "/")
      response = html_response(conn, 200)
      
      assert response =~ "Complete Financial Solutions"
      assert response =~ "Bookkeeping & Accounting"
      assert response =~ "CFO Services"
      assert response =~ "System Integration"
    end

    test "homepage has proper call-to-action buttons", %{conn: conn} do
      conn = get(conn, "/")
      response = html_response(conn, 200)
      
      assert response =~ "Get Free Consultation"
      assert response =~ "View Pricing"
      assert response =~ "href=\"/contact\""
      assert response =~ "href=\"/pricing\""
    end
  end

  describe "SEO and Meta Tags" do
    test "all pages have proper meta descriptions", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "<meta name=\"description\"", "Page #{page} should have meta description"
        assert response =~ "accounting" or response =~ "CPA" or response =~ "financial", "Page #{page} should have relevant business keywords"
      end
    end

    test "all pages have proper Open Graph tags", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "property=\"og:title\"", "Page #{page} should have Open Graph title"
        assert response =~ "property=\"og:description\"", "Page #{page} should have Open Graph description"
        assert response =~ "property=\"og:image\"", "Page #{page} should have Open Graph image"
      end
    end

    test "all pages have proper page titles", %{conn: conn} do
      test_cases = [
        {"/", "MTG Consulting"},
        {"/pricing", "Pricing"},
        {"/team", "Team"},
        {"/contact", "Contact"}
      ]
      
      for {page, expected_title_content} <- test_cases do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "<title>", "Page #{page} should have a title tag"
        assert response =~ expected_title_content, "Page #{page} should contain '#{expected_title_content}' in title"
      end
    end
  end

  describe "Page consistency checks" do
    test "all pages load successfully", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact", "/articles"]
      
      for page <- pages do
        conn = get(conn, page)
        assert html_response(conn, 200), "Page #{page} should load successfully"
      end
    end

    test "all pages have proper purple background styling", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check for purple background mentioned in design requirements
        assert response =~ "rgb(29, 9, 89)" or response =~ "bg-primary-purple", "Page #{page} should have purple background"
      end
    end

    test "all pages have footer information", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "MTG Consulting", "Page #{page} should contain company name"
        assert response =~ "2025", "Page #{page} should contain copyright year"
      end
    end

    test "all pages use consistent font system", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check for Google Fonts preconnection and font families
        assert response =~ "fonts.googleapis.com", "Page #{page} should preconnect to Google Fonts"
        assert response =~ "Poppins" or response =~ "Source Sans Pro", "Page #{page} should use the professional font system"
      end
    end
  end

  describe "Form and CTA Testing" do
    test "contact page has proper contact information", %{conn: conn} do
      conn = get(conn, "/contact")
      response = html_response(conn, 200)
      
      assert response =~ "michael@mtg-consulting.net"
      assert response =~ "airtable" # Contact form integration
    end

    test "pricing page has proper CTA buttons", %{conn: conn} do
      conn = get(conn, "/pricing")
      response = html_response(conn, 200)
      
      assert response =~ "Learn More"
      assert response =~ "href=" # Should have clickable links
    end
  end

  describe "Responsive Design Tests" do
    test "all pages have responsive meta viewport", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        assert response =~ "name=\"viewport\"", "Page #{page} should have responsive viewport meta tag"
        assert response =~ "width=device-width", "Page #{page} should set proper viewport width"
      end
    end

    test "all pages use responsive CSS classes", %{conn: conn} do
      pages = ["/", "/pricing", "/team", "/contact"]
      
      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)
        
        # Check for common responsive Tailwind classes
        assert response =~ "sm:" or response =~ "md:" or response =~ "lg:", "Page #{page} should use responsive CSS classes"
      end
    end
  end
end
