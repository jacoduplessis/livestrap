defmodule LivestrapDev.Router do
  use Phoenix.Router

  import Phoenix.LiveView.Router
  import LiveCapture.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LivestrapDev.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    pipe_through :browser
    live_capture "/", LivestrapDev.LiveCapture
  end
end
