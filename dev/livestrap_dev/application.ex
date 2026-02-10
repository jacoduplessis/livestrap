defmodule LivestrapDev.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LivestrapDev.Endpoint
    ]

    opts = [strategy: :one_for_one, name: LivestrapDev.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
