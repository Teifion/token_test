defmodule TokenTest.Repo do
  use Ecto.Repo,
    otp_app: :token_test,
    adapter: Ecto.Adapters.Postgres
end
