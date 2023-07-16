defmodule TmdbClone.Schema.MoviePeople do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :movie_id,
    :actor_id
  ]

  @permitted_fields [
    @required_fields
  ]

  schema "movie_people" do
    field :movie_id, :integer
    field :actor_id, :integer
  end

  def changeset(movie_people, attrs) do
    movie_people
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:movie_id, :actor_id], name: :movie_id_actor_id_index)
  end
end
