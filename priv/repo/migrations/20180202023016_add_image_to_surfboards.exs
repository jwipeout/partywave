defmodule Partywave.Repo.Migrations.AddImageToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :image, :string
    end
  end
end
