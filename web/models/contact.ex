defmodule FenixApi.Contact do
  use FenixApi.Web, :model

  schema "contacts" do
    field :fullname, :string
    field :email, :string
    field :code_area, :integer
    field :phone_number, :string
    field :observations, :string
    belongs_to :user, FenixApi.User

    timestamps
  end

  @required_fields ~w(fullname code_area phone_number user_id)
  @optional_fields ~w(email observations)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
