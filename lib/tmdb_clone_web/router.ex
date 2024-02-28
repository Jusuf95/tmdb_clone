defmodule TmdbCloneWeb.Router do
  use TmdbCloneWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.LoadResource
  end

  scope "/api", TmdbCloneWeb do
    pipe_through(:api)
    get "/get_movie", MoviesControler, :get_movie
    post "/users", UserController, :create
    post "/sign_in", UserController, :sign_in

    pipe_through(:auth)
    delete "/users/:id", UserController, :delete
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:tmdb_clone, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TmdbCloneWeb.Telemetry
    end
  end
end
