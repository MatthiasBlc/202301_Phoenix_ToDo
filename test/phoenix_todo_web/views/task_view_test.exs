defmodule PhoenixTodoWeb.TaskViewTest do
  use PhoenixTodoWeb.ConnCase, async: true
  import PhoenixTodo.TasksFixtures
  alias PhoenixTodoWeb.TaskView

  test "count_tasks/2 returns count of tasks where completed" do
    tasks = [
      %{text: "first", completed: true},
      %{text: "first", completed: false},
      %{text: "first", completed: false}
    ]

    assert 1 = TaskView.count_tasks(true, tasks)
  end

  test "count_tasks/2 returns count of tasks where not completed" do
    tasks = [
      %{text: "first", completed: true},
      %{text: "first", completed: false},
      %{text: "first", completed: false}
    ]

    assert 2 = TaskView.count_tasks(false, tasks)
  end
end
