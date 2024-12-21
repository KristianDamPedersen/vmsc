defmodule Vmsc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Vmsc.Repo,
      {DNSCluster, query: Application.get_env(:vmsc, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Vmsc.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Vmsc.Finch}
      # Start a worker by calling: Vmsc.Worker.start_link(arg)
      # {Vmsc.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Vmsc.Supervisor)
  end
end
