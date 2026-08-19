defmodule MtgwebWeb.RedirectController do
  use MtgwebWeb, :controller

  def bio_to_team(conn, _params) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: ~p"/team")
  end

  def system_integration(conn, _params), do: permanent_redirect(conn, "/services/system-integration")
  def bank_financing(conn, _params), do: permanent_redirect(conn, "/services/bank-financing")
  def bookkeeping(conn, _params), do: permanent_redirect(conn, "/services/bookkeeping")
  def clients(conn, _params), do: permanent_redirect(conn, "/services/clients")

  defp permanent_redirect(conn, path) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: path)
  end
end
