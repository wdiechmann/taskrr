# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :coral,
  namespace: Coral,
  ecto_repos: [Coral.Repo]

# Configures the endpoint
config :coral, CoralWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FiycqTHdk+zDEUTxCHBDnKLF0KC3/E3quUXieBtvKbzjp0me/aDW/MogspTq5gX8",
  render_errors: [view: CoralWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Coral.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
