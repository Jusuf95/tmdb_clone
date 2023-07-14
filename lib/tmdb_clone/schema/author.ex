defmodule TmdbClone.Schema.Author do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
  :movie_name,
  :author_name
  ]

  @permitted_fields [
    :biography
    | @required_fields
  ]

  schema "author" do
    field :movie_name, :string
    field :author_name, :string
    field :biography, :string
  end

  def changeset(author, attrs) do
    author
    |> cast(attrs, @permitted_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:author_name], name: :author_name_index)
  end
end
