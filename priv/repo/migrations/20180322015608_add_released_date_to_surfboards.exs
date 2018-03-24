defmodule Partywave.Repo.Migrations.AddReleasedDateToSurfboards do
  use Ecto.Migration

  def change do
    alter table("surfboards") do
      add :released_on, :naive_datetime, null: false
    end
  end
end
