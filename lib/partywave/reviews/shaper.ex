defmodule Partywave.Reviews.Shaper do
  use Ecto.Schema
  import Ecto.Changeset
  alias Partywave.Reviews.Shaper


  schema "shapers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Shaper{} = shaper, attrs) do
    shaper
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
