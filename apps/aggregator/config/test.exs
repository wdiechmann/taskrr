use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :aggregator, AggregatorWeb.Endpoint,
  http: [port: 4103],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :aggregator, Aggregator.Repo,
  # adapter: Ecto.Adapters.Postgres,
  # username: "user",
  # password: "user",
  # database: "taskrr_test",
  # hostname: "172.18.0.3",
  # pool_size: 10
  adapter: Ecto.Adapters.MySQL,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_TEST_NAME"),
  hostname: System.get_env("DB_HOST"),
  pool_size: 10
