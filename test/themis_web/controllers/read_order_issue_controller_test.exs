defmodule ThemisWeb.ReadOrderIssueControllerTest do
  use ThemisWeb.ConnCase

  import Themis.Admin.ReadOrdersFixtures

  @create_attrs %{sort_order: 42}
  @update_attrs %{sort_order: 43}
  @invalid_attrs %{sort_order: nil}

  describe "index" do
    test "lists all readorder_issues", %{conn: conn} do
      conn = get(conn, ~p"/readorder_issues")
      assert html_response(conn, 200) =~ "Listing Readorder issues"
    end
  end

  describe "new read_order_issue" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/readorder_issues/new")
      assert html_response(conn, 200) =~ "New Read order issue"
    end
  end

  describe "create read_order_issue" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/readorder_issues", read_order_issue: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/readorder_issues/#{id}"

      conn = get(conn, ~p"/readorder_issues/#{id}")
      assert html_response(conn, 200) =~ "Read order issue #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/readorder_issues", read_order_issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Read order issue"
    end
  end

  describe "edit read_order_issue" do
    setup [:create_read_order_issue]

    test "renders form for editing chosen read_order_issue", %{conn: conn, read_order_issue: read_order_issue} do
      conn = get(conn, ~p"/readorder_issues/#{read_order_issue}/edit")
      assert html_response(conn, 200) =~ "Edit Read order issue"
    end
  end

  describe "update read_order_issue" do
    setup [:create_read_order_issue]

    test "redirects when data is valid", %{conn: conn, read_order_issue: read_order_issue} do
      conn = put(conn, ~p"/readorder_issues/#{read_order_issue}", read_order_issue: @update_attrs)
      assert redirected_to(conn) == ~p"/readorder_issues/#{read_order_issue}"

      conn = get(conn, ~p"/readorder_issues/#{read_order_issue}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, read_order_issue: read_order_issue} do
      conn = put(conn, ~p"/readorder_issues/#{read_order_issue}", read_order_issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Read order issue"
    end
  end

  describe "delete read_order_issue" do
    setup [:create_read_order_issue]

    test "deletes chosen read_order_issue", %{conn: conn, read_order_issue: read_order_issue} do
      conn = delete(conn, ~p"/readorder_issues/#{read_order_issue}")
      assert redirected_to(conn) == ~p"/readorder_issues"

      assert_error_sent 404, fn ->
        get(conn, ~p"/readorder_issues/#{read_order_issue}")
      end
    end
  end

  defp create_read_order_issue(_) do
    read_order_issue = read_order_issue_fixture()
    %{read_order_issue: read_order_issue}
  end
end
