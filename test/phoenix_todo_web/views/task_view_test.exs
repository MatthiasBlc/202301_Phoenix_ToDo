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

  describe "filter_tasks/2" do
    setup [:create_tasks]

    test "list tasks", %{tasks: tasks} do
      params = %{}

      assert tasks == TaskView.filter_tasks(params, tasks)
    end

    test "returns active tasks", %{tasks: tasks} do
      params = %{"completed" => "false"}
      active_tasks = Enum.take(tasks, 2)

      assert active_tasks == TaskView.filter_tasks(params, tasks)
    end

    test "returns completed tasks", %{tasks: tasks} do
      params = %{"completed" => "true"}
      completed_tasks = [List.last(tasks)]

      assert completed_tasks == TaskView.filter_tasks(params, tasks)
    end
  end

  defp create_tasks(_) do
    tasks = tasks_fixture()
    %{tasks: tasks}
  end
end
