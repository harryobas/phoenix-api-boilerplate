# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FenixApi.Repo.insert!(%FenixApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user = FenixApi.User.registration_changeset(%FenixApi.User{}, %{name: "Claudia", email: "claudia@sorta.in", password: "<3phoenix"})
FenixApi.Repo.insert!(user)
contact = FenixApi.Contact.changeset(%FenixApi.Contact{}, %{fullname: "Jose Valim", code_area: 11, phone_number: "99999-9999", user_id: 1})
FenixApi.Repo.insert!(contact)