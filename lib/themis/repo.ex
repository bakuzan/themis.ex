defmodule Themis.Repo do
  use Ecto.Repo,
    otp_app: :themis,
    adapter: Ecto.Adapters.SQLite3
end
