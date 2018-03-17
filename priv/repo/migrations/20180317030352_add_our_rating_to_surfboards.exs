defmodule Partywave.Repo.Migrations.AddOurRatingToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :our_rating, :integer, default: 0, null: false
    end
  end
end
