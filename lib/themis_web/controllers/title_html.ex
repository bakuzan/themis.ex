defmodule ThemisWeb.TitleHTML do
  use ThemisWeb, :html

  embed_templates "title_html/*"

  @doc """
  Renders a title form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def title_form(assigns)
end
