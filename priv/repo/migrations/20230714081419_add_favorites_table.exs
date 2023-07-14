defmodule TmdbClone.Repo.Migrations.AddFavoritesTable do
  use Ecto.Migration

  def change do
    create table(:favorite_movie) do
      add :movie_name, :string, null: false
      add :name, :string, null: false
    end
  end
end
