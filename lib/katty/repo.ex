defmodule Katty.Repo do
  use Ecto.Repo,
    otp_app: :katty,
    adapter: Ecto.Adapters.Postgres
end
