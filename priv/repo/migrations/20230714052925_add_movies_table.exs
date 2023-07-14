defmodule TmdbClone.Repo.Migrations.AddMoviesTable do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :movie_name, :string, null: false
      add :author, :string, null: false
      add :rate, :float
      add :date, :date
      add :category, :string, null: false
      add :overview, :text
      add :time, :string
    end

    create unique_index(:movies, [:movie_name])
  end
end
