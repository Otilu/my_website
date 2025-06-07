import Config

# Ensure Phoenix server starts
if System.get_env("PHX_SERVER") do
  config :my_website, MyWebsiteWeb.Endpoint, server: true
end

if config_env() == :prod do
  ## DATABASE CONFIGURATION
  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  config :my_website, MyWebsite.Repo,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
    ssl: true

  ## SECRET KEY BASE
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  ## HOST + PORT
  host = System.get_env("PHX_HOST") || "my-website.onrender.com"
  port = String.to_integer(System.get_env("PORT") || "10000")

  config :my_website, MyWebsiteWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    check_origin: false,  # Optional: disable origin check (useful if you're deploying multiple frontends)
    secret_key_base: secret_key_base
end
