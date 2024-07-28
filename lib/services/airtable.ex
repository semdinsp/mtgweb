defmodule Services.Airtable do
  # We are going to implement the public interface in a minute...

  def all(table), do: do_get("/#{table}")

  def get(table, record_id), do: do_get("/#{table}/#{record_id}")

  defp client do
    middleware = [
      {Tesla.Middleware.BaseUrl, api_url() <> base_id()},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger,
      {Tesla.Middleware.Headers, [{"authorization", "Bearer " <> personal_access_token()}]}
    ]

    Tesla.client(middleware)
  end

  defp do_get(path) do
    client()
    |> Tesla.get(path)
    |> case do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %{status: status}} ->
        {:error, status}

      other ->
        other
    end
  end

  defp api_url, do: Application.get_env(:mtgweb, __MODULE__)[:api_url]

  #defp api_key, do: Application.get_env(:mtgweb, __MODULE__)[:api_key]

  defp base_id, do: Application.get_env(:mtgweb, __MODULE__)[:base_id]

 #old defp personal_access_token, do: Application.get_env(:mtgweb, __MODULE__)[:personal_access_token]
 # compile try defp personal_access_token, do: Application.compile_env(:mtgweb, [__MODULE__, :personal_access_token])
 defp personal_access_token, do: Application.get_env(:mtgweb, __MODULE__)[:personal_access_token]

end
