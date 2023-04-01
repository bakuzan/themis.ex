defmodule Themis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ThemisWeb.Telemetry,
      # Start the Ecto repository
      Themis.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Themis.PubSub},
      # Start Finch
      {Finch, name: Themis.Finch},
      # Start the Endpoint (http/https)
      ThemisWeb.Endpoint
      # Start a worker by calling: Themis.Worker.start_link(arg)
      # {Themis.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Themis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThemisWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
