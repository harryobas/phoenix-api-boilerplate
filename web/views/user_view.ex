defmodule FenixApi.UserView do
  use FenixApi.Web, :view

  def render("show.json", %{user: user}) do
    %{data: render_one(user, FenixApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email}
  end
end
