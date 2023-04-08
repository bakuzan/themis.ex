defmodule ThemisWeb.ReadOrderIssueHTML do
  use ThemisWeb, :html

  embed_templates "read_order_issue_html/*"

  @doc """
  Renders a read_order_issue form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def read_order_issue_form(assigns)
end
