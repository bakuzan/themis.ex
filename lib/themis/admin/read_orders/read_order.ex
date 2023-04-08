defmodule Themis.Admin.ReadOrders.ReadOrder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "readorders" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(read_order, attrs) do
    read_order
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
