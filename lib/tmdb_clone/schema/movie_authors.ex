defmodule TmdbClone.Schema.MovieAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
  :movie_id,
  :author_id
  ]

  @permitted_fields [
    @required_fields
  ]

  schema "movie_authors" do
    field :movie_id, :integer
    field :author_id, :integer
  end

  def changeset(movie_authors, attrs) do
    movie_authors
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:movie_id, :author_id], name: :movie_id_author_id_index)
  end
end
