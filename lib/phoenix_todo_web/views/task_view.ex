defmodule PhoenixTodoWeb.TaskView do
  use PhoenixTodoWeb, :view

  def count_tasks(completed, tasks) do
    tasks
    |> Enum.count(fn task -> task.completed == completed end)
  end
end
