defmodule TmdbClone.Repo.Migrations.AddAuthorTable do
  use Ecto.Migration

  def change do
    create table(:author) do
      add :movie_name, :string, null: false
      add :author_name, :string, null: false
      add :biography, :text
    end

    create unique_index(:author, [:author_name])
  end
end
