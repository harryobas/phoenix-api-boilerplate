defmodule FenixApi.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :fullname, :string, null: false
      add :email, :string
      add :code_area, :integer
      add :phone_number, :string
      add :observations, :string

      timestamps
    end
  end
end
