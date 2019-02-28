defmodule Tasks1Web.TaskItemControllerTest do
  use Tasks1Web.ConnCase

  alias Tasks1.Tasks

  @create_attrs %{completed: true, desc: "some desc", time_spent: 42, title: "some title"}
  @update_attrs %{completed: false, desc: "some updated desc", time_spent: 43, title: "some updated title"}
  @invalid_attrs %{completed: nil, desc: nil, time_spent: nil, title: nil}

  def fixture(:task_item) do
    {:ok, task_item} = Tasks.create_task_item(@create_attrs)
    task_item
  end

  describe "index" do
    test "lists all task_items", %{conn: conn} do
      conn = get(conn, Routes.task_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Task items"
    end
  end

  describe "new task_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.task_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Task item"
    end
  end

  describe "create task_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_item_path(conn, :create), task_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.task_item_path(conn, :show, id)

      conn = get(conn, Routes.task_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Task item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_item_path(conn, :create), task_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Task item"
    end
  end

  describe "edit task_item" do
    setup [:create_task_item]

    test "renders form for editing chosen task_item", %{conn: conn, task_item: task_item} do
      conn = get(conn, Routes.task_item_path(conn, :edit, task_item))
      assert html_response(conn, 200) =~ "Edit Task item"
    end
  end

  describe "update task_item" do
    setup [:create_task_item]

    test "redirects when data is valid", %{conn: conn, task_item: task_item} do
      conn = put(conn, Routes.task_item_path(conn, :update, task_item), task_item: @update_attrs)
      assert redirected_to(conn) == Routes.task_item_path(conn, :show, task_item)

      conn = get(conn, Routes.task_item_path(conn, :show, task_item))
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, task_item: task_item} do
      conn = put(conn, Routes.task_item_path(conn, :update, task_item), task_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Task item"
    end
  end

  describe "delete task_item" do
    setup [:create_task_item]

    test "deletes chosen task_item", %{conn: conn, task_item: task_item} do
      conn = delete(conn, Routes.task_item_path(conn, :delete, task_item))
      assert redirected_to(conn) == Routes.task_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.task_item_path(conn, :show, task_item))
      end
    end
  end

  defp create_task_item(_) do
    task_item = fixture(:task_item)
    {:ok, task_item: task_item}
  end
end
