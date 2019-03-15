defmodule Tasks1Web.Router do
  use Tasks1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
		plug Tasks1Web.Plugs.FetchSession
		plug Tasks1Web.Plugs.AddShownUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

	pipeline :ajax do
		plug :accepts, ["json"]
		plug :fetch_session
		plug :fetch_flash
		plug Tasks1Web.Plugs.FetchSession
	end

  scope "/", Tasks1Web do
    pipe_through :browser

    get "/", PageController, :index
		resources "/users", UserController
		resources "/task_items", TaskItemController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true

  end

  # Other scopes may use custom stacks.
  # scope "/api", Tasks1Web do
  #   pipe_through :api
  # end
	scope "/ajax", Tasks1Web do
		pipe_through :ajax
		resources "/timeblocks", TimeBlockController, except: [:new, :edit]

	end
end
