defmodule Themis.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :number, :integer
      add :is_annual, :boolean, default: false, null: false
      add :name, :string
      add :cover_date, :string
      add :title_id, references(:titles, on_delete: :nothing)

      timestamps()
    end

    create index(:issues, [:title_id])
    create unique_index(:issues, [:number, :is_annual, :title_id], name: :issue_unique_columns)
  end
end
