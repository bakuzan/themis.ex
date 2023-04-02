defmodule Themis.Admin.Catalogue do
  @moduledoc """
  The Admin.Catalogue context.
  """

  import Ecto.Query, warn: false
  alias Themis.Repo

  alias Themis.Admin.Catalogue.Title

  @doc """
  Returns the list of titles.

  ## Examples

      iex> list_titles()
      [%Title{}, ...]

  """
  def list_titles do
    Repo.all(Title)
  end

  @doc """
  Gets a single title.

  Raises `Ecto.NoResultsError` if the Title does not exist.

  ## Examples

      iex> get_title!(123)
      %Title{}

      iex> get_title!(456)
      ** (Ecto.NoResultsError)

  """
  def get_title!(id), do: Repo.get!(Title, id)

  @doc """
  Creates a title.

  ## Examples

      iex> create_title(%{field: value})
      {:ok, %Title{}}

      iex> create_title(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_title(attrs \\ %{}) do
    %Title{}
    |> Title.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a title.

  ## Examples

      iex> update_title(title, %{field: new_value})
      {:ok, %Title{}}

      iex> update_title(title, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_title(%Title{} = title, attrs) do
    title
    |> Title.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a title.

  ## Examples

      iex> delete_title(title)
      {:ok, %Title{}}

      iex> delete_title(title)
      {:error, %Ecto.Changeset{}}

  """
  def delete_title(%Title{} = title) do
    Repo.delete(title)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking title changes.

  ## Examples

      iex> change_title(title)
      %Ecto.Changeset{data: %Title{}}

  """
  def change_title(%Title{} = title, attrs \\ %{}) do
    Title.changeset(title, attrs)
  end

  alias Themis.Admin.Catalogue.Issue

  @doc """
  Returns the list of issues.

  ## Examples

      iex> list_issues()
      [%Issue{}, ...]

  """
  def list_issues do
    Issue |> Repo.all |> Repo.preload(:title)
  end

  @doc """
  Gets a single issue.

  Raises `Ecto.NoResultsError` if the Issue does not exist.

  ## Examples

      iex> get_issue!(123)
      %Issue{}

      iex> get_issue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_issue!(id) do 
    Issue |> Repo.get!(id) |> Repo.preload(:title)
  end

  @doc """
  Creates a issue.

  ## Examples

      iex> create_issue(%{field: value})
      {:ok, %Issue{}}

      iex> create_issue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_issue(attrs \\ %{}) do
    %Issue{}
    |> Issue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a issue.

  ## Examples

      iex> update_issue(issue, %{field: new_value})
      {:ok, %Issue{}}

      iex> update_issue(issue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_issue(%Issue{} = issue, attrs) do
    issue
    |> Issue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a issue.

  ## Examples

      iex> delete_issue(issue)
      {:ok, %Issue{}}

      iex> delete_issue(issue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_issue(%Issue{} = issue) do
    Repo.delete(issue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking issue changes.

  ## Examples

      iex> change_issue(issue)
      %Ecto.Changeset{data: %Issue{}}

  """
  def change_issue(%Issue{} = issue, attrs \\ %{}) do
    Issue.changeset(issue, attrs)
  end
end
