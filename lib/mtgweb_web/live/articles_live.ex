defmodule MtgwebWeb.ArticlesLive do
  use MtgwebWeb, :live_view

  alias MtgwebWeb.LiveEncoder

  @topic "articles"

  @impl  Phoenix.LiveView
  def mount(_params, _session, socket) do
    MtgwebWeb.Endpoint.subscribe(@topic)

    {:ok, assign_socket(socket), temporary_assigns: [articles: []]}
  end

  @impl  Phoenix.LiveView
  def handle_info(%{event: "update"}, socket) do
    {:noreply, assign_socket(socket)}
  end

  def render_article(socket, %{id: _id, slug: _slug} = article,counter ) do
    Phoenix.Template.render_to_iodata(MtgwebWeb.PageHTML, "article", "html", socket: socket, article: article , counter: counter)
    |> Phoenix.HTML.raw()
  end

  defp assign_socket(socket) do
    case fetch_articles() do
      {:ok, articles} ->
        socket
        |> assign(:page_title, "Small Business Accounting Services | CPA & QuickBooks Solutions")
        |> assign(:meta_description, "Expert small business accounting services and QuickBooks solutions. CPA-led team providing comprehensive financial management for growing businesses.")
        |> assign(:og_title, "Small Business Accounting Services | CPA & QuickBooks Solutions")
        |> assign(:og_description, "Expert small business accounting services and QuickBooks solutions from certified professionals.")
        |> assign(:og_url, "https://mtg-consulting.net/articles")
        |> assign(:articles, articles)
        |> put_flash(:error, nil)

      _ ->
        socket
        |> assign(:page_title, "Small Business Accounting Services | CPA & QuickBooks Solutions")
        |> assign(:articles, nil)
        |> put_flash(:error, "Error fetching data")
    end
  end

  defp fetch_articles do
    with {:ok, articles} <- Mtgweb.articles() do
      articles
      |> Enum.sort_by(& &1.published_at)
      |> LiveEncoder.articles()

      {:ok, articles}
    end
  end
end
