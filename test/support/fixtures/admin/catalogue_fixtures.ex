defmodule Themis.Admin.CatalogueFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Themis.Admin.Catalogue` context.
  """

  @doc """
  Generate a title.
  """
  def title_fixture(attrs \\ %{}) do
    {:ok, title} =
      attrs
      |> Enum.into(%{
        is_one_shot: true,
        name: "some name",
        start_year: 42
      })
      |> Themis.Admin.Catalogue.create_title()

    title
  end
end
