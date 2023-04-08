defmodule ThemisWeb.ReadOrderHTML do
  use ThemisWeb, :html

  embed_templates "read_order_html/*"

  @doc """
  Renders a read_order form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def read_order_form(assigns)
end
