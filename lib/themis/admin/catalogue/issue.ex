defmodule Themis.Admin.Catalogue.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  alias Themis.Admin.Books.Collection

  schema "issues" do
    field :cover_date, :string
    field :is_annual, :boolean, default: false
    field :name, :string
    field :number, :integer

    belongs_to :title, Themis.Admin.Catalogue.Title
    many_to_many :collections, Collection, join_through: "collection_issues", on_replace: :delete  

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:number, :is_annual, :name, :cover_date, :title_id])
    |> validate_required([:number, :is_annual, :name, :cover_date, :title_id])
    |> unique_constraint(:unique_issue, name: :issue_unique_columns)
  end
end
