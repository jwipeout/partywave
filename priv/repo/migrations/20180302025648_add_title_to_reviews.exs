defmodule Partywave.Repo.Migrations.AddTitleToReviews do
  use Ecto.Migration

  def change do
    alter table("reviews") do
      add :title, :string
    end
  end
end
