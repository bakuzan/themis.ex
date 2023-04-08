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
  def get_read_order!(id) do
    ReadOrder |> Repo.get!(id) |> Repo.preload(:read_order_issues)
  end

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

  alias Themis.Admin.ReadOrders.ReadOrderIssue

  @doc """
  Returns the list of readorder_issues.

  ## Examples

      iex> list_readorder_issues()
      [%ReadOrderIssue{}, ...]

  """
  def list_readorder_issues do
    Repo.all(ReadOrderIssue)
  end

  @doc """
  Gets a single read_order_issue.

  Raises `Ecto.NoResultsError` if the Read order issue does not exist.

  ## Examples

      iex> get_read_order_issue!(123)
      %ReadOrderIssue{}

      iex> get_read_order_issue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_read_order_issue!(id), do: Repo.get!(ReadOrderIssue, id)

  @doc """
  Creates a read_order_issue.

  ## Examples

      iex> create_read_order_issue(%{field: value})
      {:ok, %ReadOrderIssue{}}

      iex> create_read_order_issue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_read_order_issue(attrs \\ %{}) do
    %ReadOrderIssue{}
    |> ReadOrderIssue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a read_order_issue.

  ## Examples

      iex> update_read_order_issue(read_order_issue, %{field: new_value})
      {:ok, %ReadOrderIssue{}}

      iex> update_read_order_issue(read_order_issue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_read_order_issue(%ReadOrderIssue{} = read_order_issue, attrs) do
    read_order_issue
    |> ReadOrderIssue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a read_order_issue.

  ## Examples

      iex> delete_read_order_issue(read_order_issue)
      {:ok, %ReadOrderIssue{}}

      iex> delete_read_order_issue(read_order_issue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_read_order_issue(%ReadOrderIssue{} = read_order_issue) do
    Repo.delete(read_order_issue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking read_order_issue changes.

  ## Examples

      iex> change_read_order_issue(read_order_issue)
      %Ecto.Changeset{data: %ReadOrderIssue{}}

  """
  def change_read_order_issue(%ReadOrderIssue{} = read_order_issue, attrs \\ %{}) do
    ReadOrderIssue.changeset(read_order_issue, attrs)
  end
end
