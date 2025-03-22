# article cms
defmodule Mtgweb.Article do
  alias __MODULE__

  @type t :: %Article{
          id: String.t(),
          slug: String.t(),
          title: String.t(),
          description: String.t(),
          image: String.t(),
          content: String.t(),
          author: String.t(),
          summary: String.t(),
          published_at: Date.t()
        }

  defstruct [:id, :slug, :title, :description, :image, :content, :author, :summary, :published_at]
end
