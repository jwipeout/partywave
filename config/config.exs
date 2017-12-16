# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :partywave,
  ecto_repos: [Partywave.Repo]

# Configures the endpoint
config :partywave, PartywaveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vl4EoN2x3FlOlYz/PWCt4JjPGblrqCHtElXQR/QVG+TRcVA00dkBqtqFBl2Totaj",
  render_errors: [view: PartywaveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Partywave.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
