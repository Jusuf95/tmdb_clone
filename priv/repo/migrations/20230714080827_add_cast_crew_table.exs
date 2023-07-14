defmodule TmdbClone.Repo.Migrations.AddCastCrewTable do
  use Ecto.Migration

  def change do
    create table(:crew) do
      add :biography, :text
      add :actor_name, :string, null: false
      add :movie_name, :string, null: false
      add :role, :string
    end

    create unique_index(:crew, [:actor_name])
  end
end
