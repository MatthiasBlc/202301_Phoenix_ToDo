defmodule PhoenixTodoWeb.TaskView do
  use PhoenixTodoWeb, :view

  def count_task(completed, tasks) do
    tasks
    |> Enum.count(fn task -> task.completed == completed end)
  end
end
