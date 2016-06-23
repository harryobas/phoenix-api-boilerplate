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

  @fields ~w(fullname code_area phone_number user_id email observations)
  @required_fields ~w(fullname code_area phone_number user_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)
    |> validate_required([:fullname, :code_area, :phone_number, :user_id])
  end
end
