import Config

config :livestrap, LivestrapDev.Endpoint,
  http: [port: 4002],
  url: [host: "localhost"],
  secret_key_base: String.duplicate("dev_secret_key_base_livestrap_", 3),
  live_view: [signing_salt: "livestrap_dev"],
  server: true,
  live_reload: [
    patterns: [
      ~r"dev/.*(ex|heex)$",
      ~r"lib/.*(ex|heex)$"
    ]
  ]

config :phoenix, :json_library, Jason
