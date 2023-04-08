defmodule Themis.Repo.Migrations.CreateReadorderIssues do
  use Ecto.Migration

  def change do
    create table(:readorder_issues) do
      add :sort_order, :integer
      add :read_order_id, references(:readorders, on_delete: :nothing)
      add :collection_id, references(:collections, on_delete: :nothing), null: true
      add :issue_id, references(:issues, on_delete: :nothing)

      timestamps()
    end

    create index(:readorder_issues, [:read_order_id])
    create index(:readorder_issues, [:collection_id])
    create index(:readorder_issues, [:issue_id])
    create unique_index(:readorder_issues, [:read_order_id, :collection_id, :issue_id], name: :readorder_issue_unique_columns)
  end
end
