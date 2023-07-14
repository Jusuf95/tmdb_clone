import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :tmdb_clone, TmdbClone.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tmdb_clone_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tmdb_clone, TmdbCloneWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MfoHO5ovezclLtLwM9zxYmgV8A5G1bFin349ASHjdlNvutPU4x05bNmH6IK5T48l",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
