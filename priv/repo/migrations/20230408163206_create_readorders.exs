defmodule Themis.Repo.Migrations.CreateReadorders do
  use Ecto.Migration

  def change do
    create table(:readorders) do
      add :name, :string

      timestamps()
    end

    create unique_index(:readorders, [:name])
  end
end
