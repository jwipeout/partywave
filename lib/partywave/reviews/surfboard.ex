defmodule Partywave.Reviews.Surfboard do
  use Ecto.Schema
  import Ecto.Changeset
  alias Partywave.Reviews.Surfboard


  schema "surfboards" do
    field :length, :float
    field :model, :string
    field :thickness, :float
    field :volume, :float
    field :width, :float

    belongs_to :category, Partywave.Reviews.Category
    belongs_to :shaper, Partywave.Reviews.Shaper

    timestamps()
  end

  @doc false
  def changeset(%Surfboard{} = surfboard, attrs) do
    surfboard
    |> cast(attrs, [:model, :length, :width, :thickness, :volume])
    |> validate_required([:model, :length, :width, :thickness, :volume])
    |> assoc_constraint(:shaper)
  end
end
