defmodule MyWebsiteWeb.PageController do
  use MyWebsiteWeb, :controller

  def search(conn, %{"query" => query}) do
    # Dummy results for demonstration
    results = [
      %{title: "Sample Result 1", description: "This matches your search: #{query}"},
      %{title: "Sample Result 2", description: "Another result for: #{query}"}
    ]
    render(conn, :search, results: results, query: query)
  end

  def blog(conn, _params), do: render(conn, :blog, layout: false)
  def profile(conn, _params), do: render(conn, :profile, layout: false)
  def team(conn, _params), do: render(conn, :team, layout: false)
  def home(conn, _params), do: render(conn, :home, layout: false)
  def forgot_password(conn, _params), do: render(conn, :forgot_password, layout: false)
  def main(conn, _params), do: render(conn, :main, layout: false)
  def about(conn, _params), do: render(conn, :about, layout: false)
  def services(conn, _params), do: render(conn, :services, layout: false)
  def contact(conn, _params), do: render(conn, :contact, layout: false)
  def settings(conn, _params), do: render(conn, :settings, layout: false)
  def get(conn, _params), do: render(conn, :get, layout: false)

  def login(conn, %{"email" => email, "password" => password, "2fa_code" => _code}) do
    # Replace with your real admin credentials
    if email == "admin@kakwarahospital.org" and password == "your_admin_password" do
      conn
      |> put_session(:user, "admin")
      |> redirect(to: ~p"/profile")
    else
      conn
      |> put_flash(:error, "Invalid admin credentials")
      |> render(:login, layout: false)
    end
  end

  def login(conn, _params), do: render(conn, :login, layout: false)
  def signup(conn, _params), do: render(conn, :signup, layout: false)
  def help(conn, _params), do: render(conn, :help, layout: false)

  def logout(conn, _params) do
    # Clear the session or perform logout logic
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "You have been logged out.")
    |> redirect(to: "/login")
  end
end
