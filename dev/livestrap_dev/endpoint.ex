defmodule LivestrapDev.Endpoint do
  use Phoenix.Endpoint, otp_app: :livestrap

  @session_options [
    store: :cookie,
    key: "_livestrap_dev_key",
    signing_salt: "livestrap_dev"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :livestrap,
    gzip: false

  plug Plug.RequestId
  plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json], json_decoder: Jason
  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug LivestrapDev.Router
end
