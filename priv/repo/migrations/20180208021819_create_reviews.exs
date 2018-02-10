defmodule Partywave.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :body, :text
      add :rating, :integer, default: 0, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :surfboard_id, references(:surfboards, on_delete: :delete_all)

      timestamps()
    end

    create index(:reviews, [:user_id])
    create index(:reviews, [:surfboard_id])
  end
end
