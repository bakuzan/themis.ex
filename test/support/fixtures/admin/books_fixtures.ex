defmodule Themis.Admin.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Themis.Admin.Books` context.
  """

  @doc """
  Generate a collection.
  """
  def collection_fixture(attrs \\ %{}) do
    {:ok, collection} =
      attrs
      |> Enum.into(%{
        name: "some name",
        number: 42,
        publication_date: 42
      })
      |> Themis.Admin.Books.create_collection()

    collection
  end
end
