defmodule LutaWeb.Router do
  use LutaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LutaWeb do
    pipe_through :api

    get "/arena", ArenaController, :index

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in

    # resources "/users", UserController, only: [:show]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: LutaWeb.Telemetry
    end
  end
end
