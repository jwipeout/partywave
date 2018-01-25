defmodule Partywave.Repo.Migrations.AddUniqueConstraintsSurfboard do
  use Ecto.Migration

  def change do
    create unique_index(:surfboards, [:model])
    create unique_index(:categories, [:name])
    create unique_index(:shapers, [:name])
  end
end
