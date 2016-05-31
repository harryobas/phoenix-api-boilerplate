defmodule FenixApi.Router do
  use FenixApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FenixApi do
    pipe_through :browser
    resources "/sessions", SessionController, only: [:new]
  end

  pipeline :api_auth do  
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", FenixApi do
    pipe_through :api
    get "/", ContactController, :index

    resources "/contacts", ContactController, except: [:new, :edit]
    resources "/users", UserController, only: [:create]
    resources "/sessions", SessionController, only: [:create]
  end
end
