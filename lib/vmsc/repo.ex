defmodule Vmsc.Repo do
  use Ecto.Repo,
    otp_app: :vmsc,
    adapter: Ecto.Adapters.Postgres
end
