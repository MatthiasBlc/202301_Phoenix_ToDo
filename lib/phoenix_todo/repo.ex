defmodule PhoenixTodo.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_todo,
    adapter: Ecto.Adapters.Postgres
end
