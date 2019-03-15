defmodule Tasks1.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :start, :time
      add :end, :time
      add :user_id, references(:users, on_delete: :nothing)
      add :task_item_id, references(:task_items, on_delete: :nothing)

      timestamps()
    end

    create index(:timeblocks, [:user_id])
    create index(:timeblocks, [:task_item_id])
  end
end
