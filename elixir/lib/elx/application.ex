defmodule Elx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElxWeb.Telemetry,
      Elx.Repo,
      {DNSCluster, query: Application.get_env(:elx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Elx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Elx.Finch},
      # Start a worker by calling: Elx.Worker.start_link(arg)
      # {Elx.Worker, arg},
      # Start to serve requests, typically the last entry
      ElxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
