# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :tmdb_clone, TmdbClone.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tmdb_clone",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :tmdb_clone,
  ecto_repos: [TmdbClone.Repo]

# Configures the endpoint
config :tmdb_clone, TmdbCloneWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: TmdbCloneWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: TmdbClone.PubSub,
  live_view: [signing_salt: "E7T+psGW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
