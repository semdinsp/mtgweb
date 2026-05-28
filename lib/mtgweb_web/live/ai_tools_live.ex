defmodule MtgwebWeb.AiToolsLive do
  use MtgwebWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "AI Tools for Small Business | MTG Consulting")
     |> assign(:meta_description, "Custom AI-powered tools built for small businesses. From Gmail support request scanning to set-theoretic reporting, MTG Consulting brings enterprise-grade automation to your team.")
     |> assign(:og_title, "AI Tools for Small Business | MTG Consulting")
     |> assign(:og_description, "Custom AI-powered tools built for small businesses. Automate workflows, surface insights, and report with precision.")
     |> assign(:og_url, "https://mtg-consulting.net/ai-tools")}
  end
end
