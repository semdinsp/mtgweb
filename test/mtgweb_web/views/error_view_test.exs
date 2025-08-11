defmodule MtgwebWeb.ErrorViewTest do
  use MtgwebWeb.ConnCase, async: true

  test "renders 404.html" do
    assert MtgwebWeb.ErrorView.template_not_found("404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert MtgwebWeb.ErrorView.template_not_found("500.html", []) == "Internal Server Error"
  end
end
