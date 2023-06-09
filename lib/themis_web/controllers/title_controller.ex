defmodule ThemisWeb.TitleController do
  use ThemisWeb, :controller

  alias Themis.Admin.Catalogue
  alias Themis.Admin.Catalogue.Title

  def index(conn, _params) do
    titles = Catalogue.list_titles()
    render(conn, :index, titles: titles)
  end

  def new(conn, _params) do
    changeset = Catalogue.change_title(%Title{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"title" => title_params}) do
    case Catalogue.create_title(title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title created successfully.")
        |> redirect(to: ~p"/titles/#{title}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    title = Catalogue.get_title!(id)
    render(conn, :show, title: title)
  end

  def edit(conn, %{"id" => id}) do
    title = Catalogue.get_title!(id)
    changeset = Catalogue.change_title(title)
    render(conn, :edit, title: title, changeset: changeset)
  end

  def update(conn, %{"id" => id, "title" => title_params}) do
    title = Catalogue.get_title!(id)

    case Catalogue.update_title(title, title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title updated successfully.")
        |> redirect(to: ~p"/titles/#{title}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, title: title, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    title = Catalogue.get_title!(id)
    {:ok, _title} = Catalogue.delete_title(title)

    conn
    |> put_flash(:info, "Title deleted successfully.")
    |> redirect(to: ~p"/titles")
  end
end
