defmodule FenixApi.User do
  use FenixApi.Web, :model
  # @derive {Poison.Encoder, except: [:__meta__]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :company, :string
    field :code_area, :integer
    field :phone_number, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many :contacts, FenixApi.Contact

    timestamps
  end

  @fields ~w(name email company code_area phone_number)
  @required_fields ~w(email)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)
    |> validate_required([:email])
    |> validate_length(:email, min: 1, max: 255)
    |> validate_format(:email, ~r/@/)
  end

  def registration_changeset(model, params \\ %{}) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end