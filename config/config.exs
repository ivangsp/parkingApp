# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :parking_app,
  ecto_repos: [ParkingApp.Repo]

# Configures the endpoint
config :parking_app, ParkingApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jmnrEbz6BazzXQSlC9BuAqSKvtmG5YxLgKeJZ7nIRfEeEC7Z5ggLWt9yEkdFrmsd",
  render_errors: [view: ParkingApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ParkingApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
