defmodule ThemisWeb.PageController do
  use ThemisWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
