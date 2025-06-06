defmodule MyWebsiteWeb.Router do
  use MyWebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MyWebsiteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyWebsiteWeb do
    pipe_through :browser

    get "/home", PageController, :home
    get "/main", PageController, :main
    get "/about", PageController, :about
    get "/services", PageController, :services
    get "/contact", PageController, :contact
    get "/login", PageController, :login
    get"/get",PageController , :get
    get "/signup", PageController, :signup
    get "/profile", PageController, :profile
    get "/settings", PageController, :settings
    get "/logout", PageController, :logout
    get "/help", PageController, :help
    get "/forgot-password", PageController, :forgot_password
    get "/blog", PageController, :blog
    get "/team", PageController, :team
    get "/search", PageController, :search

  end

  # Other scopes may use custom stacks.
  # scope "/api", MyWebsiteWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:my_website, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MyWebsiteWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
