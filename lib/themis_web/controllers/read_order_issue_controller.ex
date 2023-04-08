defmodule ThemisWeb.ReadOrderIssueController do
  use ThemisWeb, :controller

  alias Themis.Admin.ReadOrders
  alias Themis.Admin.ReadOrders.ReadOrderIssue

  def index(conn, _params) do
    readorder_issues = ReadOrders.list_readorder_issues()
    render(conn, :index, readorder_issues: readorder_issues)
  end

  def new(conn, _params) do
    changeset = ReadOrders.change_read_order_issue(%ReadOrderIssue{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"read_order_issue" => read_order_issue_params}) do
    case ReadOrders.create_read_order_issue(read_order_issue_params) do
      {:ok, read_order_issue} ->
        conn
        |> put_flash(:info, "Read order issue created successfully.")
        |> redirect(to: ~p"/readorder_issues/#{read_order_issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    read_order_issue = ReadOrders.get_read_order_issue!(id)
    render(conn, :show, read_order_issue: read_order_issue)
  end

  def edit(conn, %{"id" => id}) do
    read_order_issue = ReadOrders.get_read_order_issue!(id)
    changeset = ReadOrders.change_read_order_issue(read_order_issue)
    render(conn, :edit, read_order_issue: read_order_issue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "read_order_issue" => read_order_issue_params}) do
    read_order_issue = ReadOrders.get_read_order_issue!(id)

    case ReadOrders.update_read_order_issue(read_order_issue, read_order_issue_params) do
      {:ok, read_order_issue} ->
        conn
        |> put_flash(:info, "Read order issue updated successfully.")
        |> redirect(to: ~p"/readorder_issues/#{read_order_issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, read_order_issue: read_order_issue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    read_order_issue = ReadOrders.get_read_order_issue!(id)
    {:ok, _read_order_issue} = ReadOrders.delete_read_order_issue(read_order_issue)

    conn
    |> put_flash(:info, "Read order issue deleted successfully.")
    |> redirect(to: ~p"/readorder_issues")
  end
end
