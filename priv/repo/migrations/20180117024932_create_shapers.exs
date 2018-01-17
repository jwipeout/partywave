defmodule Partywave.Repo.Migrations.CreateShapers do
  use Ecto.Migration

  def change do
    create table(:shapers) do
      add :name, :string

      timestamps()
    end

  end
end
