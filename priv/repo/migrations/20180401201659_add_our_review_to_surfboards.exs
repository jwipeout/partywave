defmodule Partywave.Repo.Migrations.AddOurReviewToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :our_review, :text
    end
  end
end
