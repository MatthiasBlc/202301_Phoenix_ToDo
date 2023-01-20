defmodule PhoenixTodoWeb.TaskView do
  use PhoenixTodoWeb, :view

  def count_tasks(completed, tasks) do
    tasks
    |> Enum.count(fn task -> task.completed == completed end)
  end

  def filter_tasks(params, tasks) do
    if Enum.empty?(params) do
      tasks
    else
      completed = String.to_existing_atom(params["completed"])

      tasks
      |> Enum.filter(fn t -> t.completed == completed end)
    end
  end
end
