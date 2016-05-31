defmodule FenixApi.SessionView do
  use FenixApi.Web, :view
  
  def render("show.json", %{session: session}) do
    %{data: render_one(session, FenixApi.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("login.json", %{jwt: jwt}) do
    %{"token": jwt}
  end

  def render("error.json", _anything) do
    %{errors: "kiiiu"}
  end
end