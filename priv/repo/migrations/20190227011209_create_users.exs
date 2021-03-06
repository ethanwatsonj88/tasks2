defmodule Tasks1.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
			add :is_manager, :boolean
			add :manager_id, :integer
      timestamps()
    end

  end
end
