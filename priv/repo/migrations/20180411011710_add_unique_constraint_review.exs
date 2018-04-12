defmodule Partywave.Repo.Migrations.AddUniqueConstraintReview do
  use Ecto.Migration

  def change do
    create unique_index(:reviews, [:user_id, :surfboard_id], name: :unique_review_per_surfboard)
  end
end
