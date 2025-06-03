defmodule MyWebsiteWeb.PageController do
  use MyWebsiteWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def main(conn, _params) do
    # The about page can use the default layout.
    render(conn, :main, layout: false)
  end
end
