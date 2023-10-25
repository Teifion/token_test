defmodule TokenTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TokenTestWeb.Telemetry,
      # Start the Ecto repository
      TokenTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TokenTest.PubSub},
      # Start the Endpoint (http/https)
      TokenTestWeb.Endpoint
      # Start a worker by calling: TokenTest.Worker.start_link(arg)
      # {TokenTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TokenTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TokenTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
