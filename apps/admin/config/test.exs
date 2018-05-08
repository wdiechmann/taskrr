use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin, AdminWeb.Endpoint,
  http: [port: 4101],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :admin, Admin.Repo,
  # adapter: Ecto.Adapters.MySQL,
  # username: ${DB_USER},
  # password: ${DB_PASSWORD},
  # database: "taskrr_dev",
  # hostname: "dbserver"
  # pool_size: 10
  adapter: Ecto.Adapters.MySQL,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_TEST_NAME"),
  hostname: System.get_env("DB_HOST"),
  pool_size: 10
