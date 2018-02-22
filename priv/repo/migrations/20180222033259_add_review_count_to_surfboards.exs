defmodule Partywave.Repo.Migrations.AddReviewCountToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :reviews_count, :integer, default: 0, null: false
    end
  end
end
