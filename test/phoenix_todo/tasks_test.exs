defmodule PhoenixTodo.TasksTest do
  use PhoenixTodo.DataCase

  alias PhoenixTodo.Tasks

  describe "tasks" do
    alias PhoenixTodo.Tasks.Task

    import PhoenixTodo.TasksFixtures

    @invalid_attrs %{completed: nil, text: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{completed: true, text: "some text"}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.completed == true
      assert task.text == "some text"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{completed: false, text: "some updated text"}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.completed == false
      assert task.text == "some updated text"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end

    test "clear/1 updates tasks completed to false" do
      task_fixture()
      clear = Tasks.clear()

      assert {1, _task} = clear
    end
  end
end
