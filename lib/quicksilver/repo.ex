defmodule Quicksilver.Repo do
  use Ecto.Repo,
    otp_app: :quicksilver,
    adapter: Ecto.Adapters.Postgres
end
