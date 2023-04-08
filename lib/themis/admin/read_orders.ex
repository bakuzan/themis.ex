defmodule Themis.Admin.ReadOrders do
  @moduledoc """
  The Admin.ReadOrders context.
  """

  import Ecto.Query, warn: false
  alias Themis.Repo

  alias Themis.Admin.ReadOrders.ReadOrder

  @doc """
  Returns the list of readorders.

  ## Examples

      iex> list_readorders()
      [%ReadOrder{}, ...]

  """
  def list_readorders do
    Repo.all(ReadOrder)
  end

  @doc """
  Gets a single read_order.

  Raises `Ecto.NoResultsError` if the Read order does not exist.

  ## Examples

      iex> get_read_order!(123)
      %ReadOrder{}

      iex> get_read_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_read_order!(id), do: Repo.get!(ReadOrder, id)

  @doc """
  Creates a read_order.

  ## Examples

      iex> create_read_order(%{field: value})
      {:ok, %ReadOrder{}}

      iex> create_read_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_read_order(attrs \\ %{}) do
    %ReadOrder{}
    |> ReadOrder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a read_order.

  ## Examples

      iex> update_read_order(read_order, %{field: new_value})
      {:ok, %ReadOrder{}}

      iex> update_read_order(read_order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_read_order(%ReadOrder{} = read_order, attrs) do
    read_order
    |> ReadOrder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a read_order.

  ## Examples

      iex> delete_read_order(read_order)
      {:ok, %ReadOrder{}}

      iex> delete_read_order(read_order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_read_order(%ReadOrder{} = read_order) do
    Repo.delete(read_order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking read_order changes.

  ## Examples

      iex> change_read_order(read_order)
      %Ecto.Changeset{data: %ReadOrder{}}

  """
  def change_read_order(%ReadOrder{} = read_order, attrs \\ %{}) do
    ReadOrder.changeset(read_order, attrs)
  end
end
