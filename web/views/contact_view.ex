defmodule FenixApi.ContactView do
  use FenixApi.Web, :view

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, FenixApi.ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, FenixApi.ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{id: contact.id,
      user_id: contact.user_id,
      fullname: contact.fullname,
      email: contact.email,
      code_area: contact.code_area,
      phone_number: contact.phone_number,
      observations: contact.observations}
  end
end
