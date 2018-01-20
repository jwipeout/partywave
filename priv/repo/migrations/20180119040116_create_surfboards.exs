defmodule Partywave.Repo.Migrations.CreateSurfboards do
  use Ecto.Migration

  def change do
    create table(:surfboards) do
      add :model, :string
      add :length, :float
      add :width, :float
      add :thickness, :float
      add :volume, :float
      add :user_id, references(:users, on_delete: :nothing)
      add :shaper_id, references(:shapers, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:surfboards, [:user_id])
    create index(:surfboards, [:shaper_id])
    create index(:surfboards, [:category_id])
  end
end
