defmodule Themis.Repo.Migrations.CreateCollectionIssues do
  use Ecto.Migration

  def change do
    create table(:collection_issues, primary_key: false) do
      add :collection_id, references(:collections, on_delete: :delete_all)
      add :issue_id, references(:issues, on_delete: :delete_all)
    end

    create index(:collection_issues, [:collection_id])
    create unique_index(:collection_issues, [:issue_id, :collection_id])
  end
end