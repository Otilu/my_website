defmodule MyWebsite.Repo do
  use Ecto.Repo,
    otp_app: :my_website,
    adapter: Ecto.Adapters.SQLite3
end
