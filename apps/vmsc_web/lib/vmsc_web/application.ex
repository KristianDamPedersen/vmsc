defmodule VmscWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VmscWeb.Telemetry,
      # Start a worker by calling: VmscWeb.Worker.start_link(arg)
      # {VmscWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      VmscWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VmscWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VmscWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
