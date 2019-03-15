defmodule Tasks1.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
		field :is_manager, :boolean
		field :manager_id, :integer
		has_many :task_items, Tasks1.Tasks.TaskItem		
		has_many :time_blocks, Tasks1.TimeBlocks.TimeBlock
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end
end
