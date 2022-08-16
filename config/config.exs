import Config

config :katty,
  ecto_repos: [Katty.Repo]

# Configures the endpoint
config :katty, KattyWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KattyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Katty.PubSub,
  live_view: [signing_salt: "yWQvS0zQ"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :katty, Katty.Mailer, adapter: Swoosh.Adapters.Local

config :katty,
page_url: "dashboard.madkatty.com",
company_name: "Katty Inc",
company_address: "Kat Boulevard 21",
company_zip: "54933-7180",
company_city: "Lulzsec",
company_state: "Memories",
company_country: "Slaydown",
contact_name: "Katty Mad",
contact_phone: "+1 (127) 0-0-1",
contact_email: "admin@madkatty.com",
from_email: "admin@madkatty.com"

config :katty, Katty.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "smtp.freesmtpservers.com",
  username: "",
  password: "",
  ssl: :false,
  tls: :never,
  auth: :never,
  port: 25,
  retries: 2,
  no_mx_lookup: true
# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind, version: "3.0.24",
default: [
  args: ~w(
    --config=tailwind.config.js
    --input=css/app.css
    --output=../priv/static/assets/app.css
  ),
  cd: Path.expand("../assets", __DIR__)
]
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :recaptcha,
public_key:  "6LflGHohAAAAALr6myJDEyMuH4eBXD5q2cH-mc1v",
secret:  "6LflGHohAAAAAPUGGxmOh9T2fIYFmP6JJ6BAD76X"
import_config "#{config_env()}.exs"
