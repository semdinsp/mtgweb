import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
# SCOTT config :mtgweb, Mtgweb.Repo,
 # SCOTT username: "postgres",
 # SCOTT password: "postgres",
 # SCOTT hostname: "localhost",
 # SCOTT database: "mtgweb_test#{System.get_env("MIX_TEST_PARTITION")}",
 # SCOTT pool: Ecto.Adapters.SQL.Sandbox,
 # SCOTT pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mtgweb, MtgwebWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "fkDSlhzXirTc/X4Q3K5GUXN2omSb4mp3pCQVsywrgjQFxfVI7/6VqUDNhwrFt5Lw",
  server: false

# In test we don't send emails.
config :mtgweb, Mtgweb.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
