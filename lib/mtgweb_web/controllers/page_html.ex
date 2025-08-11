defmodule MtgwebWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use MtgwebWeb, :html
  use Gettext, backend: Mtgweb.Gettext

  embed_templates "page_html/*"
end