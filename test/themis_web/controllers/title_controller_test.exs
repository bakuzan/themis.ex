defmodule ThemisWeb.TitleControllerTest do
  use ThemisWeb.ConnCase

  import Themis.Admin.CatalogueFixtures

  @create_attrs %{is_one_shot: true, name: "some name", start_year: 42}
  @update_attrs %{is_one_shot: false, name: "some updated name", start_year: 43}
  @invalid_attrs %{is_one_shot: nil, name: nil, start_year: nil}

  describe "index" do
    test "lists all titles", %{conn: conn} do
      conn = get(conn, ~p"/titles")
      assert html_response(conn, 200) =~ "Listing Titles"
    end
  end

  describe "new title" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/titles/new")
      assert html_response(conn, 200) =~ "New Title"
    end
  end

  describe "create title" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/titles", title: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/titles/#{id}"

      conn = get(conn, ~p"/titles/#{id}")
      assert html_response(conn, 200) =~ "Title #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/titles", title: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Title"
    end
  end

  describe "edit title" do
    setup [:create_title]

    test "renders form for editing chosen title", %{conn: conn, title: title} do
      conn = get(conn, ~p"/titles/#{title}/edit")
      assert html_response(conn, 200) =~ "Edit Title"
    end
  end

  describe "update title" do
    setup [:create_title]

    test "redirects when data is valid", %{conn: conn, title: title} do
      conn = put(conn, ~p"/titles/#{title}", title: @update_attrs)
      assert redirected_to(conn) == ~p"/titles/#{title}"

      conn = get(conn, ~p"/titles/#{title}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, title: title} do
      conn = put(conn, ~p"/titles/#{title}", title: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Title"
    end
  end

  describe "delete title" do
    setup [:create_title]

    test "deletes chosen title", %{conn: conn, title: title} do
      conn = delete(conn, ~p"/titles/#{title}")
      assert redirected_to(conn) == ~p"/titles"

      assert_error_sent 404, fn ->
        get(conn, ~p"/titles/#{title}")
      end
    end
  end

  defp create_title(_) do
    title = title_fixture()
    %{title: title}
  end
end
