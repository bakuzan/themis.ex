defmodule ThemisWeb.IssueHTML do
  use ThemisWeb, :html

  embed_templates "issue_html/*"

  @doc """
  Renders a issue form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def issue_form(assigns)

  import Phoenix.HTML.Form

  def title_select(f, changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:titles, [])
      |> Enum.map(& &1.data.id)

    title_opts =
      for t <- Themis.Admin.Catalogue.list_titles(),
          do: [key: t.name, value: t.id, selected: t.id in existing_ids]

    select(f, :title_id, title_opts)
  end  
end
