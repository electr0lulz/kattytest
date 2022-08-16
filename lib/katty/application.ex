defmodule Katty.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # OK
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Katty.Repo,
      # Start the Telemetry supervisor
      KattyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Katty.PubSub},
      # Start the Endpoint (http/https)
      KattyWeb.Endpoint
      # Start a worker by calling: Katty.Worker.start_link(arg)
      # {Katty.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Katty.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KattyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
