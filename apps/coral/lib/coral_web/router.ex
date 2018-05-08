defmodule CoralWeb.Router do
  use CoralWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CoralWeb do
    pipe_through :api
  end
end
