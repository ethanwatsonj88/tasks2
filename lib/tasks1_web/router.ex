defmodule Tasks1Web.Router do
  use Tasks1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
		plug Tasks1Web.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tasks1Web do
    pipe_through :browser

    get "/", PageController, :index
		resources "/users", UserController
		resources "/task_items", TaskItemController
    resources "/sessions", SessionController, only: [:delete, :create], singleton: true

  end

  # Other scopes may use custom stacks.
  # scope "/api", Tasks1Web do
  #   pipe_through :api
  # end
end
