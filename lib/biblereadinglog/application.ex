defmodule Biblereadinglog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BiblereadinglogWeb.Telemetry,
      Biblereadinglog.Repo,
      {DNSCluster, query: Application.get_env(:biblereadinglog, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Biblereadinglog.PubSub},
      # Start a worker by calling: Biblereadinglog.Worker.start_link(arg)
      # {Biblereadinglog.Worker, arg},
      # Start to serve requests, typically the last entry
      BiblereadinglogWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Biblereadinglog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BiblereadinglogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
