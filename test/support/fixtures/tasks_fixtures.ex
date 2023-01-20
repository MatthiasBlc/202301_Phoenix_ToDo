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
end
