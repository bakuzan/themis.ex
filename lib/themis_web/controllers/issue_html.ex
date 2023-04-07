defmodule ThemisWeb.IssueHTML do
  use ThemisWeb, :html

  embed_templates "issue_html/*"

  @doc """
  Renders a issue form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def issue_form(assigns)

  require Logger
  import Phoenix.HTML.Form

  def title_select(f, changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:titles, [])
      |> Enum.map(& &1.data.id)

    title_opts =
      for t <- Themis.Admin.Catalogue.list_titles(),
          do: [key: t.name, value: t.id, selected: t.id in existing_ids]

    # This doesn't work and I don't know why
    disable_prompt = 
      Enum.count(existing_ids) !== 0

    select(f, :title_id, title_opts, prompt: [key: "Choose a title", disabled: disable_prompt])
  end  
end
