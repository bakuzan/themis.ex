defmodule Themis.Admin.ReadOrdersTest do
  use Themis.DataCase

  alias Themis.Admin.ReadOrders

  describe "readorders" do
    alias Themis.Admin.ReadOrders.ReadOrder

    import Themis.Admin.ReadOrdersFixtures

    @invalid_attrs %{name: nil}

    test "list_readorders/0 returns all readorders" do
      read_order = read_order_fixture()
      assert ReadOrders.list_readorders() == [read_order]
    end

    test "get_read_order!/1 returns the read_order with given id" do
      read_order = read_order_fixture()
      assert ReadOrders.get_read_order!(read_order.id) == read_order
    end

    test "create_read_order/1 with valid data creates a read_order" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ReadOrder{} = read_order} = ReadOrders.create_read_order(valid_attrs)
      assert read_order.name == "some name"
    end

    test "create_read_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ReadOrders.create_read_order(@invalid_attrs)
    end

    test "update_read_order/2 with valid data updates the read_order" do
      read_order = read_order_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ReadOrder{} = read_order} = ReadOrders.update_read_order(read_order, update_attrs)
      assert read_order.name == "some updated name"
    end

    test "update_read_order/2 with invalid data returns error changeset" do
      read_order = read_order_fixture()
      assert {:error, %Ecto.Changeset{}} = ReadOrders.update_read_order(read_order, @invalid_attrs)
      assert read_order == ReadOrders.get_read_order!(read_order.id)
    end

    test "delete_read_order/1 deletes the read_order" do
      read_order = read_order_fixture()
      assert {:ok, %ReadOrder{}} = ReadOrders.delete_read_order(read_order)
      assert_raise Ecto.NoResultsError, fn -> ReadOrders.get_read_order!(read_order.id) end
    end

    test "change_read_order/1 returns a read_order changeset" do
      read_order = read_order_fixture()
      assert %Ecto.Changeset{} = ReadOrders.change_read_order(read_order)
    end
  end

  describe "readorder_issues" do
    alias Themis.Admin.ReadOrders.ReadOrderIssue

    import Themis.Admin.ReadOrdersFixtures

    @invalid_attrs %{sort_order: nil}

    test "list_readorder_issues/0 returns all readorder_issues" do
      read_order_issue = read_order_issue_fixture()
      assert ReadOrders.list_readorder_issues() == [read_order_issue]
    end

    test "get_read_order_issue!/1 returns the read_order_issue with given id" do
      read_order_issue = read_order_issue_fixture()
      assert ReadOrders.get_read_order_issue!(read_order_issue.id) == read_order_issue
    end

    test "create_read_order_issue/1 with valid data creates a read_order_issue" do
      valid_attrs = %{sort_order: 42}

      assert {:ok, %ReadOrderIssue{} = read_order_issue} = ReadOrders.create_read_order_issue(valid_attrs)
      assert read_order_issue.sort_order == 42
    end

    test "create_read_order_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ReadOrders.create_read_order_issue(@invalid_attrs)
    end

    test "update_read_order_issue/2 with valid data updates the read_order_issue" do
      read_order_issue = read_order_issue_fixture()
      update_attrs = %{sort_order: 43}

      assert {:ok, %ReadOrderIssue{} = read_order_issue} = ReadOrders.update_read_order_issue(read_order_issue, update_attrs)
      assert read_order_issue.sort_order == 43
    end

    test "update_read_order_issue/2 with invalid data returns error changeset" do
      read_order_issue = read_order_issue_fixture()
      assert {:error, %Ecto.Changeset{}} = ReadOrders.update_read_order_issue(read_order_issue, @invalid_attrs)
      assert read_order_issue == ReadOrders.get_read_order_issue!(read_order_issue.id)
    end

    test "delete_read_order_issue/1 deletes the read_order_issue" do
      read_order_issue = read_order_issue_fixture()
      assert {:ok, %ReadOrderIssue{}} = ReadOrders.delete_read_order_issue(read_order_issue)
      assert_raise Ecto.NoResultsError, fn -> ReadOrders.get_read_order_issue!(read_order_issue.id) end
    end

    test "change_read_order_issue/1 returns a read_order_issue changeset" do
      read_order_issue = read_order_issue_fixture()
      assert %Ecto.Changeset{} = ReadOrders.change_read_order_issue(read_order_issue)
    end
  end
end
