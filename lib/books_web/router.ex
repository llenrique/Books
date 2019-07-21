defmodule BooksWeb.Router do
  use BooksWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BooksWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/new", BookController, :index
    post "/new", BookController, :create
    get "/show/:id", BookController, :show
    post "/review/:book_id", ReviewController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", BooksWeb do
  #   pipe_through :api
  # end
end
