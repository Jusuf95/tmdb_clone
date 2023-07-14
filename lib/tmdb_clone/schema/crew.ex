defmodule TmdbClone.Schema.Crew do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :movie_name,
    :actor_name
  ]

  @permitted_fields [
    :biography,
    :role
    | @required_fields
  ]

  schema "crew" do
    field :movie_name, :string
    field :actor_name, :string
    field :biography, :string
    field :role, :string
  end

  def changeset(crew, attrs) do
    crew
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:actor_name], name: :actor_name_index)
  end
end
