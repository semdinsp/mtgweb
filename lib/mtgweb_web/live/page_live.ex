defmodule MtgwebWeb.PageLive do
  use MtgwebWeb, :live_view

  alias MtgwebWeb.LiveEncoder


  @topic "contents"

  @testimonials %{type: "testimonials", content: [
    %{
      id: "testimonial_1",
      type: "testimonial",
      title: "Testimonial Test",
      author: "Fred"},
     %{ id: "benfit", type: "testimonial", title: " Michael Grandinetti is an accountant by profession but he is a great motivator and manager who applies principles of human relations to motivate his employees to be productive. He has a strong intuition which enables him to anticipate and get rid of problems before they exist. He is a great team player. who strongly believes that 'no man is an island'. I listen whenever Mike speaks. ",
        author: "Ben Fitial" },
    ]
    }

  @impl  Phoenix.LiveView
  def mount(_params, _session, socket) do
    MtgwebWeb.Endpoint.subscribe(@topic)



    {:ok, assign_socket(socket), temporary_assigns: [contents: [], testimonials: @testimonials]}
  end

  @impl  Phoenix.LiveView
  def handle_info(%{event: "update"}, socket) do
    {:noreply, assign_socket(socket)}
  end

  def render_section(%{type: "hero"} = content) do
   # IO.inspect(label: "hero", content: content)

    Phoenix.View.render(MtgwebWeb.PageView, "hero.html", content: content)
  end

  def render_section(%{type: "text_and_image"} = content) do
    Phoenix.View.render(MtgwebWeb.PageView, "text_and_image.html", content: content)
  end

  def render_section(%{features: content}) do
   # IO.inspect(label: "features", content: content)
    Phoenix.View.render(MtgwebWeb.PageView, "features.html", content: content)
  end



  def render_section(%{type: "testimonials"} = @testimonials) do
    # IO.inspect(label: "SCOTT DEBUG testimonials", list: @testimonials)
     Phoenix.View.render(MtgwebWeb.PageView, "testimonial.html", list: @testimonials.content)
  end

  def render_section(_), do: ""

  defp assign_socket(socket) do
    case fetch_contents() do
      {:ok, contents} ->
        socket
        |> assign(:page_title, "MTG Consulting")
        |> assign(:contents, contents)
        |> put_flash(:error, nil)

      _ ->
        socket
        |> assign(:page_title, "MTG: Error")
        |> assign(:contents, nil)
        |> put_flash(:error, "Error fetching data")
    end
  end

  defp fetch_contents do
    with {:ok, contents} <- Mtgweb.contents() do
      contents =
        contents
        |> Enum.sort_by(& &1.position)
        |> LiveEncoder.contents()

      {:ok, contents}
    end
  end
end
