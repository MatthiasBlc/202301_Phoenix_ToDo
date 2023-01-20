defmodule PhoenixTodo.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixTodo.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed: true,
        text: "some text"
      })
      |> PhoenixTodo.Tasks.create_task()

    task
  end

  def tasks_fixture(attrs \\ %{}) do
    {:ok, task1} =
      attrs
      |> Enum.into(%{
        completed: false,
        text: "some text"
      })
      |> PhoenixTodo.Tasks.create_task()

    {:ok, task2} =
      attrs
      |> Enum.into(%{
        completed: false,
        text: "some text2"
      })
      |> PhoenixTodo.Tasks.create_task()

    {:ok, task3} =
      attrs
      |> Enum.into(%{
        completed: true,
        text: "some text3"
      })
      |> PhoenixTodo.Tasks.create_task()

    [task2, task1, task3]
  end
end
