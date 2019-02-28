defmodule Tasks1.TasksTest do
  use Tasks1.DataCase

  alias Tasks1.Tasks

  describe "task_items" do
    alias Tasks1.Tasks.TaskItem

    @valid_attrs %{completed: true, desc: "some desc", time_spent: 42, title: "some title"}
    @update_attrs %{completed: false, desc: "some updated desc", time_spent: 43, title: "some updated title"}
    @invalid_attrs %{completed: nil, desc: nil, time_spent: nil, title: nil}

    def task_item_fixture(attrs \\ %{}) do
      {:ok, task_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task_item()

      task_item
    end

    test "list_task_items/0 returns all task_items" do
      task_item = task_item_fixture()
      assert Tasks.list_task_items() == [task_item]
    end

    test "get_task_item!/1 returns the task_item with given id" do
      task_item = task_item_fixture()
      assert Tasks.get_task_item!(task_item.id) == task_item
    end

    test "create_task_item/1 with valid data creates a task_item" do
      assert {:ok, %TaskItem{} = task_item} = Tasks.create_task_item(@valid_attrs)
      assert task_item.completed == true
      assert task_item.desc == "some desc"
      assert task_item.time_spent == 42
      assert task_item.title == "some title"
    end

    test "create_task_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task_item(@invalid_attrs)
    end

    test "update_task_item/2 with valid data updates the task_item" do
      task_item = task_item_fixture()
      assert {:ok, %TaskItem{} = task_item} = Tasks.update_task_item(task_item, @update_attrs)
      assert task_item.completed == false
      assert task_item.desc == "some updated desc"
      assert task_item.time_spent == 43
      assert task_item.title == "some updated title"
    end

    test "update_task_item/2 with invalid data returns error changeset" do
      task_item = task_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task_item(task_item, @invalid_attrs)
      assert task_item == Tasks.get_task_item!(task_item.id)
    end

    test "delete_task_item/1 deletes the task_item" do
      task_item = task_item_fixture()
      assert {:ok, %TaskItem{}} = Tasks.delete_task_item(task_item)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task_item!(task_item.id) end
    end

    test "change_task_item/1 returns a task_item changeset" do
      task_item = task_item_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task_item(task_item)
    end
  end
end
