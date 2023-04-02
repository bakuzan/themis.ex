defmodule ThemisWeb.IssueController do
  require Logger
  use ThemisWeb, :controller

  alias Themis.Admin.Catalogue
  alias Themis.Admin.Catalogue.Issue

  def index(conn, _params) do
    issues = Catalogue.list_issues()
    Logger.info issues
    render(conn, :index, issues: issues)
  end

  def new(conn, _params) do
    changeset = Catalogue.change_issue(%Issue{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"issue" => issue_params}) do
    case Catalogue.create_issue(issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue created successfully.")
        |> redirect(to: ~p"/issues/#{issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    issue = Catalogue.get_issue!(id)
    Logger.info issue
    render(conn, :show, issue: issue)
  end

  def edit(conn, %{"id" => id}) do
    issue = Catalogue.get_issue!(id)
    changeset = Catalogue.change_issue(issue)
    render(conn, :edit, issue: issue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "issue" => issue_params}) do
    issue = Catalogue.get_issue!(id)

    case Catalogue.update_issue(issue, issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue updated successfully.")
        |> redirect(to: ~p"/issues/#{issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, issue: issue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    issue = Catalogue.get_issue!(id)
    {:ok, _issue} = Catalogue.delete_issue(issue)

    conn
    |> put_flash(:info, "Issue deleted successfully.")
    |> redirect(to: ~p"/issues")
  end
end
