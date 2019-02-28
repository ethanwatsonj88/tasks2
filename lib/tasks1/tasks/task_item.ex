defmodule Tasks1.Tasks.TaskItem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "task_items" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :time_spent, :integer
    field :title, :string
		belongs_to :user, Tasks1.Users.User

    timestamps()
  end

  @doc false
  def changeset(task_item, attrs) do
    task_item
    |> cast(attrs, [:completed, :desc, :time_spent, :title, :user_id])
    |> validate_required([:completed, :desc, :time_spent, :title, :user_id])
  end
end
