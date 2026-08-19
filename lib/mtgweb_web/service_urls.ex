defmodule MtgwebWeb.ServiceUrls do
  @moduledoc """
  Maps the four Airtable-backed service articles to their clean, static
  /services/* paths. Articles not in this map (e.g. future CMS entries)
  fall back to the original /articles/:id/:slug path.
  """

  @clean_paths %{
    "recMxe21SA4xycNka" => "/services/system-integration",
    "recTwyAJRgHMAsHWd" => "/services/bank-financing",
    "recaNeEc64Wq6kx0J" => "/services/bookkeeping",
    "recoZ4edVdxsIIlT0" => "/services/clients"
  }

  @spec path(String.t(), String.t()) :: String.t()
  def path(id, slug) do
    Map.get(@clean_paths, id, "/articles/#{id}/#{slug}")
  end
end
