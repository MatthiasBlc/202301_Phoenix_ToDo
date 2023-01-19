defmodule PhoenixTodoWeb.PageController do
  use PhoenixTodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
