defmodule Themis.Admin.Catalogue.Title do
  use Ecto.Schema
  import Ecto.Changeset

  schema "titles" do
    field :is_one_shot, :boolean, default: false
    field :name, :string
    field :start_year, :integer

    has_many :issues, Themis.Admin.Catalogue.Issue

    timestamps()
  end

  @doc false
  def changeset(title, attrs) do
    title
    |> cast(attrs, [:name, :start_year, :is_one_shot])
    |> validate_required([:name, :start_year, :is_one_shot])
    |> validate_number(:start_year, greater_than_or_equal_to: 1900)
  end
end
