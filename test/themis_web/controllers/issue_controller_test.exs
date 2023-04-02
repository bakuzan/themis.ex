defmodule ThemisWeb.IssueControllerTest do
  use ThemisWeb.ConnCase

  import Themis.Admin.CatalogueFixtures

  @create_attrs %{cover_date: "some cover_date", is_annual: true, name: "some name", number: 42}
  @update_attrs %{cover_date: "some updated cover_date", is_annual: false, name: "some updated name", number: 43}
  @invalid_attrs %{cover_date: nil, is_annual: nil, name: nil, number: nil}

  describe "index" do
    test "lists all issues", %{conn: conn} do
      conn = get(conn, ~p"/issues")
      assert html_response(conn, 200) =~ "Listing Issues"
    end
  end

  describe "new issue" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/issues/new")
      assert html_response(conn, 200) =~ "New Issue"
    end
  end

  describe "create issue" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/issues", issue: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/issues/#{id}"

      conn = get(conn, ~p"/issues/#{id}")
      assert html_response(conn, 200) =~ "Issue #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/issues", issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Issue"
    end
  end

  describe "edit issue" do
    setup [:create_issue]

    test "renders form for editing chosen issue", %{conn: conn, issue: issue} do
      conn = get(conn, ~p"/issues/#{issue}/edit")
      assert html_response(conn, 200) =~ "Edit Issue"
    end
  end

  describe "update issue" do
    setup [:create_issue]

    test "redirects when data is valid", %{conn: conn, issue: issue} do
      conn = put(conn, ~p"/issues/#{issue}", issue: @update_attrs)
      assert redirected_to(conn) == ~p"/issues/#{issue}"

      conn = get(conn, ~p"/issues/#{issue}")
      assert html_response(conn, 200) =~ "some updated cover_date"
    end

    test "renders errors when data is invalid", %{conn: conn, issue: issue} do
      conn = put(conn, ~p"/issues/#{issue}", issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Issue"
    end
  end

  describe "delete issue" do
    setup [:create_issue]

    test "deletes chosen issue", %{conn: conn, issue: issue} do
      conn = delete(conn, ~p"/issues/#{issue}")
      assert redirected_to(conn) == ~p"/issues"

      assert_error_sent 404, fn ->
        get(conn, ~p"/issues/#{issue}")
      end
    end
  end

  defp create_issue(_) do
    issue = issue_fixture()
    %{issue: issue}
  end
end
