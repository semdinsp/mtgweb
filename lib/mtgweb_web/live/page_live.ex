defmodule MtgwebWeb.PageLive do
  use MtgwebWeb, :live_view

  alias MtgwebWeb.LiveEncoder


  @topic "contents"

  @testimonials %{type: "testimonials", content: [
    %{
      id: "steve_c",
      type: "testimonial",
      title: "As the CEO of a Private Equity firm in the Mariana Islands, Mike increased shareholder value significantly and lead the operations, acquisition and development of several businesses. Ranging from airlines, to golf courses, to hotel and other tourism related businesses, Mike was able to really increase value. And in the telecom sector, ran a Cable TV company that entered the Internet and VOIP markets and exited at a large multiple. He also runs an Italian restaurant that makes amazing food! Well, just reach out if you want to know more. Thanks, Steve",
      author: "Steve Coleman",
      position: "COO at Mosaic Solutions"},
     %{ id: "benfit", type: "testimonial", title: " Michael Grandinetti is an accountant by profession but he is a great motivator and manager who applies principles of human relations to motivate his employees to be productive. He has a strong intuition which enables him to anticipate and get rid of problems before they exist. He is a great team player. who strongly believes that 'no man is an island'. I listen whenever Mike speaks. ",
        author: "Ben Fitial", position: "" },
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
