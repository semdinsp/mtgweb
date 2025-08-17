defmodule MtgwebWeb.NewClientFormLive do
  use MtgwebWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign_socket(socket)}
  end

  defp assign_socket(socket) do
    socket
    |> assign(:page_title, "New Client Form | MTG Consulting")
    |> assign(:meta_description, "Start your journey with MTG Consulting. Complete our new client form to begin your professional accounting and business advisory services.")
    |> assign(:og_title, "New Client Form | MTG Consulting")
    |> assign(:og_description, "Start your journey with MTG Consulting. Complete our new client form to begin your professional accounting services.")
    |> assign(:og_url, "https://mtg-consulting.net/new-client-form")
  end
end