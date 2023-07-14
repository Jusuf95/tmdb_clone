defmodule TmdbClone.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :user_name, :string, null: false
      add :email, :string, null: false
      add :pw, :string, null: false
      add :expire_data, :date, null: false
      add :registration_data, :date
    end

    create unique_index(:user, [:user_name, :email])
  end
end
