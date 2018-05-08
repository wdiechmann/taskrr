defmodule AggregatorWeb.Router do
  use AggregatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AggregatorWeb do
    pipe_through :api
  end
end
