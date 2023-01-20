defmodule PhoenixTodoWeb.TaskControllerTest do
  use PhoenixTodoWeb.ConnCase

  import PhoenixTodo.TasksFixtures

  @create_attrs %{completed: true, text: "some text"}
  @update_attrs %{completed: false, text: "some updated text"}
  @invalid_attrs %{completed: nil, text: nil}

  describe "index" do
    test "lists all tasks", %{conn: conn} do
      conn = get(conn, Routes.task_path(conn, :index))
      assert html_response(conn, 200) =~ "To do"
    end
  end

  describe "create task" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_path(conn, :create), task: @create_attrs)

      assert redirected_to(conn) == Routes.task_path(conn, :index)

      conn = get(conn, Routes.task_path(conn, :index))
      assert html_response(conn, 200) =~ "To do"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_path(conn, :create), task: @invalid_attrs)
      assert html_response(conn, 200) =~ "To do"
    end
  end

  describe "edit task" do
    setup [:create_task]

    test "renders form for editing chosen task", %{conn: conn, task: task} do
      conn = get(conn, Routes.task_path(conn, :edit, task))
      assert html_response(conn, 200) =~ "Edit Task"
    end
  end

  describe "update task" do
    setup [:create_task]

    test "redirects when data is valid", %{conn: conn, task: task} do
      conn = put(conn, Routes.task_path(conn, :update, task), task: @update_attrs)
      assert redirected_to(conn) == Routes.task_path(conn, :index)

      conn = get(conn, Routes.task_path(conn, :index))
      assert html_response(conn, 200) =~ "some updated text"
    end

    test "renders errors when data is invalid", %{conn: conn, task: task} do
      conn = put(conn, Routes.task_path(conn, :update, task), task: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Task"
    end
  end

  describe "delete task" do
    setup [:create_task]

    test "deletes chosen task", %{conn: conn, task: task} do
      conn = delete(conn, Routes.task_path(conn, :delete, task))
      assert redirected_to(conn) == Routes.task_path(conn, :index)

      conn = get(conn, Routes.task_path(conn, :index))
      refute html_response(conn, 200) =~ task.text
    end
  end

  describe "clear tasks" do
    test "redirects", %{conn: conn} do
      conn = get(conn, Routes.task_path(conn, :clear))
      assert redirected_to(conn) == Routes.task_path(conn, :index)

      conn = get(conn, Routes.task_path(conn, :index))
      refute html_response(conn, 200) =~ "Clear completed[0]"
    end
  end

  defp create_task(_) do
    task = task_fixture()
    %{task: task}
  end
end
