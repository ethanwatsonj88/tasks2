defmodule Tasks1.Repo.Migrations.CreateTaskItems do
  use Ecto.Migration

  def change do
    create table(:task_items) do
      add :title, :string, null: false
      add :desc, :text
      add :time_spent, :integer
      add :completed, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:task_items, [:user_id])
  end
end
