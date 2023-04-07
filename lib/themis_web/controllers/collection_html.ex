defmodule ThemisWeb.CollectionHTML do
  use ThemisWeb, :html

  embed_templates "collection_html/*"

  @doc """
  Renders a collection form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def collection_form(assigns)

  import Phoenix.HTML.Form  

  def issue_select(f, changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:issues, [])
      |> Enum.map(& &1.data.id)

    issue_opts =
      for iss <- Themis.Admin.Catalogue.list_issues(),
          do: [key: iss.name, value: iss.id, selected: iss.id in existing_ids]

    multiple_select(f, :issue_ids, issue_opts)
  end
end
