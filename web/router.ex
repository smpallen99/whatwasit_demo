defmodule WhatwasitDemo.Router do
  use WhatwasitDemo.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, login: true
  end

  pipeline :public do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  # Add this block
  scope "/" do
    pipe_through :public
    coherence_routes :public
  end

  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes :private
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhatwasitDemo do
    pipe_through :public # Use the default browser stack

    get "/", PageController, :index
  end
  scope "/", WhatwasitDemo do
    pipe_through :browser # Use the default browser stack

    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WhatwasitDemo do
  #   pipe_through :api
  # end
end
