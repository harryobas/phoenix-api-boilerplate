# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :fenix_api, FenixApi.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "AU4Q8Vr0IvnWaG1fhm60WnxjS9HXPo9WnGIYJe8hgDIUnNZP1yE0iE+fTJbY5tUa",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: FenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "FenixApi",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "sup3rs3cr3tk3y",
  serializer: FenixApi.Serializer
