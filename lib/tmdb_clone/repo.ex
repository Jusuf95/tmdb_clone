defmodule TmdbClone.Repo do
  use Ecto.Repo,
    otp_app: :tmdb_clone,
    adapter: Ecto.Adapters.Postgres
end
