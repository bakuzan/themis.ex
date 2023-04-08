defmodule Themis.Admin.ReadOrders.ReadOrderIssue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "readorder_issues" do
    field :sort_order, :integer

    belongs_to :read_order, Themis.Admin.ReadOrders.ReadOrder
    belongs_to :collection, Themis.Admin.Books.Collection    
    belongs_to :issue, Themis.Admin.Catalogue.Issue

    timestamps()
  end

  @doc false
  def changeset(read_order_issue, attrs) do
    read_order_issue
    |> cast(attrs, [:sort_order])
    |> validate_required([:sort_order, :read_order_id, :issue_id])
    |> unique_constraint(:unique_readorderissue, name: :readorder_issue_unique_columns)
  end
end
