defmodule Biblereadinglog.Repo do
  use Ecto.Repo,
    otp_app: :biblereadinglog,
    adapter: Ecto.Adapters.Postgres
end
