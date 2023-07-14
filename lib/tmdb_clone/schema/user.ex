defmodule TmdbClone.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
  :user_name,
  :email,
  :expire_data
  ]

  @permitted_fields [
    :pw,
    :registration_data
    | @required_fields
  ]

  schema "user" do
    field :user_name, :string
    field :email, :string
    field :pw, :string
    field :expire_data, :date
    field :registration_data, :date
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:user_name, :email], name: :user_name_email_index)
  end
end
