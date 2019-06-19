defmodule QuicksilverWeb.Router do
  use QuicksilverWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug QuicksilverWeb.Plugs.SetCurrentUser
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: QuicksilverWeb.Schema.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: QuicksilverWeb.Schema.Schema,
      socket: QuicksilverWeb.UserSocket
  end
end
