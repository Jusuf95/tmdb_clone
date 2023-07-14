defmodule TmdbClone.Schema.Movies do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
  :movie_name,
  :author,
  :category
  ]

  @permitted_fields [
    :rate,
    :date,
    :overview,
    :time
    | @required_fields
  ]

  schema "movies" do
    field :movie_name, :string
    field :author, :string
    field :rate, :string
    field :date, :date
    field :category, :string
    field :overview, :string
    field :time, :string
  end

  def changeset(movies, attrs) do
    movies
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:movie_name], name: :movie_name_index)
  end
end
