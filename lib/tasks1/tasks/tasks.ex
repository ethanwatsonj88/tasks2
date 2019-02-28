defmodule Tasks1.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Tasks1.Repo

  alias Tasks1.Tasks.TaskItem

  @doc """
  Returns the list of task_items.

  ## Examples

      iex> list_task_items()
      [%TaskItem{}, ...]

  """
  def list_task_items do
    Repo.all(TaskItem)
  end

  @doc """
  Gets a single task_item.

  Raises `Ecto.NoResultsError` if the Task item does not exist.

  ## Examples

      iex> get_task_item!(123)
      %TaskItem{}

      iex> get_task_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_item!(id), do: Repo.get!(TaskItem, id)

  @doc """
  Creates a task_item.

  ## Examples

      iex> create_task_item(%{field: value})
      {:ok, %TaskItem{}}

      iex> create_task_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_item(attrs \\ %{}) do
    %TaskItem{}
    |> TaskItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_item.

  ## Examples

      iex> update_task_item(task_item, %{field: new_value})
      {:ok, %TaskItem{}}

      iex> update_task_item(task_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_item(%TaskItem{} = task_item, attrs) do
    task_item
    |> TaskItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TaskItem.

  ## Examples

      iex> delete_task_item(task_item)
      {:ok, %TaskItem{}}

      iex> delete_task_item(task_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_item(%TaskItem{} = task_item) do
    Repo.delete(task_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_item changes.

  ## Examples

      iex> change_task_item(task_item)
      %Ecto.Changeset{source: %TaskItem{}}

  """
  def change_task_item(%TaskItem{} = task_item) do
    TaskItem.changeset(task_item, %{})
  end
end
