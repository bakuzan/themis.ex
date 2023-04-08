defmodule ThemisWeb.ReadOrderController do
  use ThemisWeb, :controller

  alias Themis.Admin.ReadOrders
  alias Themis.Admin.ReadOrders.ReadOrder

  def index(conn, _params) do
    readorders = ReadOrders.list_readorders()
    render(conn, :index, readorders: readorders)
  end

  def new(conn, _params) do
    changeset = ReadOrders.change_read_order(%ReadOrder{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"read_order" => read_order_params}) do
    case ReadOrders.create_read_order(read_order_params) do
      {:ok, read_order} ->
        conn
        |> put_flash(:info, "Read order created successfully.")
        |> redirect(to: ~p"/readorders/#{read_order}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    read_order = ReadOrders.get_read_order!(id)
    render(conn, :show, read_order: read_order)
  end

  def edit(conn, %{"id" => id}) do
    read_order = ReadOrders.get_read_order!(id)
    changeset = ReadOrders.change_read_order(read_order)
    render(conn, :edit, read_order: read_order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "read_order" => read_order_params}) do
    read_order = ReadOrders.get_read_order!(id)

    case ReadOrders.update_read_order(read_order, read_order_params) do
      {:ok, read_order} ->
        conn
        |> put_flash(:info, "Read order updated successfully.")
        |> redirect(to: ~p"/readorders/#{read_order}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, read_order: read_order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    read_order = ReadOrders.get_read_order!(id)
    {:ok, _read_order} = ReadOrders.delete_read_order(read_order)

    conn
    |> put_flash(:info, "Read order deleted successfully.")
    |> redirect(to: ~p"/readorders")
  end
end
