defmodule Themis.Admin.Books.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  alias Themis.Admin.Catalogue.Issue

  schema "collections" do
    field :name, :string
    field :number, :integer
    field :publication_date, :integer

    many_to_many :issues, Issue, join_through: "collection_issues", on_replace: :delete    

    timestamps()
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:name, :publication_date, :number])
    |> validate_required([:name, :publication_date])
    |> validate_number(:number, greater_than_or_equal_to: 1)
  end
end
