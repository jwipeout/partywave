defmodule Partywave.Reviews.Shaper do
  use Ecto.Schema
  import Ecto.Changeset
  alias Partywave.Reviews.Shaper


  schema "shapers" do
    field :name, :string

    has_many :surfboards, Partywave.Reviews.Surfboard

    timestamps()
  end

  @doc false
  def changeset(%Shaper{} = shaper, attrs) do
    shaper
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
