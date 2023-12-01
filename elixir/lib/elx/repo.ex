defmodule Elx.Repo do
  use Ecto.Repo,
    otp_app: :elx,
    adapter: Ecto.Adapters.Postgres
end
