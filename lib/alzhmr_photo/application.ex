defmodule Mtgweb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
       # Mtgweb.Repo,
      # Start the Telemetry supervisor
      MtgwebWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mtgweb.PubSub},

      # Start cache processes
      Mtgweb.Article.Cache,
      Mtgweb.Content.Cache,
      # Start the Endpoint (http/https)
      MtgwebWeb.Endpoint
      # Start a worker by calling: Mtgweb.Worker.start_link(arg)
      # {Mtgweb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mtgweb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MtgwebWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
