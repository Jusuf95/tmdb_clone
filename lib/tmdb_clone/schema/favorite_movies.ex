defmodule TmdbClone.Schema.FavoriteMovies do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
  :movie_name,
  :name
  ]

  @permitted_fields [
    @required_fields
  ]

  schema "favorite_movies" do
    field :movie_name, :string
    field :name, :string
  end

  def changeset(favorite_movies, attrs) do
    favorite_movies
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
  end
end
