# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :admin,
  namespace: Admin,
  ecto_repos: [Admin.Repo]

# Configures the endpoint
config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XQFTkqvdqzev2DuFHQtUnR6RZ/dXXOaJOKMcQTpPLJZJXKsfYlPqnmJlBAn40OdD",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Admin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
