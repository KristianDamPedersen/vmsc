defmodule Browservm.Repo do
  use Ecto.Repo,
    otp_app: :browservm,
    adapter: Ecto.Adapters.Postgres
end
