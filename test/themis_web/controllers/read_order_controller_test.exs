defmodule ThemisWeb.ReadOrderControllerTest do
  use ThemisWeb.ConnCase

  import Themis.Admin.ReadOrdersFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all readorders", %{conn: conn} do
      conn = get(conn, ~p"/readorders")
      assert html_response(conn, 200) =~ "Listing Readorders"
    end
  end

  describe "new read_order" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/readorders/new")
      assert html_response(conn, 200) =~ "New Read order"
    end
  end

  describe "create read_order" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/readorders", read_order: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/readorders/#{id}"

      conn = get(conn, ~p"/readorders/#{id}")
      assert html_response(conn, 200) =~ "Read order #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/readorders", read_order: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Read order"
    end
  end

  describe "edit read_order" do
    setup [:create_read_order]

    test "renders form for editing chosen read_order", %{conn: conn, read_order: read_order} do
      conn = get(conn, ~p"/readorders/#{read_order}/edit")
      assert html_response(conn, 200) =~ "Edit Read order"
    end
  end

  describe "update read_order" do
    setup [:create_read_order]

    test "redirects when data is valid", %{conn: conn, read_order: read_order} do
      conn = put(conn, ~p"/readorders/#{read_order}", read_order: @update_attrs)
      assert redirected_to(conn) == ~p"/readorders/#{read_order}"

      conn = get(conn, ~p"/readorders/#{read_order}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, read_order: read_order} do
      conn = put(conn, ~p"/readorders/#{read_order}", read_order: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Read order"
    end
  end

  describe "delete read_order" do
    setup [:create_read_order]

    test "deletes chosen read_order", %{conn: conn, read_order: read_order} do
      conn = delete(conn, ~p"/readorders/#{read_order}")
      assert redirected_to(conn) == ~p"/readorders"

      assert_error_sent 404, fn ->
        get(conn, ~p"/readorders/#{read_order}")
      end
    end
  end

  defp create_read_order(_) do
    read_order = read_order_fixture()
    %{read_order: read_order}
  end
end
