defmodule Partywave.Repo.Migrations.AddReviewsAverageRatingToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :reviews_average_rating, :integer, default: 0, null: false
    end
  end
end
