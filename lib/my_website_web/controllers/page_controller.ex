defmodule MyWebsiteWeb.PageController do
  use MyWebsiteWeb, :controller

  def blog(conn, _params), do: render(conn, :blog, layout: false)
  def home(conn, _params), do: render(conn, :home, layout: false)
  def forgot_password(conn, _params), do: render(conn, :forgot_password, layout: false)
  def main(conn, _params), do: render(conn, :main, layout: false)
  def about(conn, _params), do: render(conn, :about, layout: false)
  def services(conn, _params), do: render(conn, :services, layout: false)
  def contact(conn, _params), do: render(conn, :contact, layout: false)
  def settings(conn, _params), do: render(conn, :settings, layout: false)
  def get(conn, _params), do: render(conn, :get, layout: false)
  def login(conn, _params), do: render(conn, :login, layout: false)
  def signup(conn, _params), do: render(conn, :signup, layout: false)
  def help(conn, _params), do: render(conn, :help, layout: false)
  def profile(conn, _params) do
    # Assuming you have a user session or similar to check
    if get_session(conn, :user_id) do
      render(conn, :profile, layout: false)
    else
      redirect(conn, to: "/login")
    end
  end
  def logout(conn, _params) do
    # Clear the session or perform logout logic
    conn
    |> put_flash(:info, "You have been logged out.")
    |> redirect(to: "/login")
  end
end
