defmodule Themis.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :name, :string
      add :start_year, :integer
      add :is_one_shot, :boolean, default: false, null: false

      timestamps()
    end
  end
end
