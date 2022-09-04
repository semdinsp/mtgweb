defmodule Mtgweb do
  @moduledoc """
  Mtgweb keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate articles, to: Mtgweb.AirtableRepo

  defdelegate contents, to: Mtgweb.AirtableRepo


  defdelegate get_article(id), to: Mtgweb.AirtableRepo

end
