defmodule JadeWeb.Router do
  use JadeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JadeWeb do
    pipe_through :api
  end
end
