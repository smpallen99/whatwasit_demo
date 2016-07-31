# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :whatwasit_demo,
  ecto_repos: [WhatwasitDemo.Repo]

# Configures the endpoint
config :whatwasit_demo, WhatwasitDemo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nqYt0jyku8W1n+SlJC8YPY7siAVizjRGTVjzvhM/GAix9oXEmXq/WTn8aDkoAYr5",
  render_errors: [view: WhatwasitDemo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WhatwasitDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: WhatwasitDemo.User,
  repo: WhatwasitDemo.Repo,
  module: WhatwasitDemo,
  logged_out_url: "/",
  opts: [:trackable, :authenticatable]
# %% End Coherence Configuration %%

config :whatwasit,
  repo: WhatwasitDemo.Repo
