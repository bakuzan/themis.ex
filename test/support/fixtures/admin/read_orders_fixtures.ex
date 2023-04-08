defmodule Themis.Admin.ReadOrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Themis.Admin.ReadOrders` context.
  """

  @doc """
  Generate a unique read_order name.
  """
  def unique_read_order_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a read_order.
  """
  def read_order_fixture(attrs \\ %{}) do
    {:ok, read_order} =
      attrs
      |> Enum.into(%{
        name: unique_read_order_name()
      })
      |> Themis.Admin.ReadOrders.create_read_order()

    read_order
  end

  @doc """
  Generate a read_order_issue.
  """
  def read_order_issue_fixture(attrs \\ %{}) do
    {:ok, read_order_issue} =
      attrs
      |> Enum.into(%{
        sort_order: 42
      })
      |> Themis.Admin.ReadOrders.create_read_order_issue()

    read_order_issue
  end
end
