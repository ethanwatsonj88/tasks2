defmodule Tasks1Web.TaskItemController do
  use Tasks1Web, :controller

  alias Tasks1.Tasks
  alias Tasks1.Tasks.TaskItem

  def index(conn, _params) do
    task_items = Tasks.list_task_items()
    render(conn, "index.html", task_items: task_items)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task_item(%TaskItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task_item" => task_item_params}) do
    case Tasks.create_task_item(task_item_params) do
      {:ok, task_item} ->
        conn
        |> put_flash(:info, "Task item created successfully.")
        |> redirect(to: Routes.task_item_path(conn, :show, task_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task_item = Tasks.get_task_item!(id)
    render(conn, "show.html", task_item: task_item)
  end

  def edit(conn, %{"id" => id}) do
    task_item = Tasks.get_task_item!(id)
    changeset = Tasks.change_task_item(task_item)
    render(conn, "edit.html", task_item: task_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task_item" => task_item_params}) do
    task_item = Tasks.get_task_item!(id)

    case Tasks.update_task_item(task_item, task_item_params) do
      {:ok, task_item} ->
        conn
        |> put_flash(:info, "Task item updated successfully.")
        |> redirect(to: Routes.task_item_path(conn, :show, task_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task_item: task_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_item = Tasks.get_task_item!(id)
    {:ok, _task_item} = Tasks.delete_task_item(task_item)

    conn
    |> put_flash(:info, "Task item deleted successfully.")
    |> redirect(to: Routes.task_item_path(conn, :index))
  end
end
