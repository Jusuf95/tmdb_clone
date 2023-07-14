defmodule TmdbClone.Repo.Migrations.AddMovieAuthorsTable do
  use Ecto.Migration

  def change do
    create table(:movie_authors) do
      add :movie_id, references(:movies, on_delete: :nothing), null: false
      add :author_id, references(:author, on_delete: :nothing), null: false
    end

    create unique_index(:movie_authors, [:movie_id, :author_id])
  end
end
