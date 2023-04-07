defmodule Themis.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :name, :string
      add :publication_date, :integer
      add :number, :integer, null: true

      timestamps()
    end
  end
end
