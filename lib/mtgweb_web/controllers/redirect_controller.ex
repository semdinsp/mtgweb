defmodule MtgwebWeb.RedirectController do
  use MtgwebWeb, :controller

  def bio_to_team(conn, _params) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: ~p"/team")
  end
end
