defmodule TmdbClone.Repo.Migrations.AddMoviePeopleTable do
  use Ecto.Migration

  def change do
    create table(:movie_people) do
      add :movie_id, references(:movies, on_delete: :nothing), null: false
      add :actor_id, references(:crew, on_delete: :nothing), null: false
    end

    create unique_index(:movie_people, [:movie_id, :actor_id])
  end
end
