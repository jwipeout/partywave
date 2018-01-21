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
    |> cast(attrs, [:model, :length, :width, :thickness, :volume, :shaper_id])
    |> validate_required([:model, :length, :width, :thickness, :volume])
    |> assoc_constraint(:shaper)
  end

  def inches_decimal_to_ratio(decimal) do
    inches_string = Float.to_string(decimal)
    [whole_number, ratio] = String.split(inches_string, ".")
    ratio_to_float = String.to_float("0.#{ratio}")
    {numerator, denominator} = Float.ratio(ratio_to_float)
    "#{whole_number} #{numerator}/#{denominator}"
  end

  def thickness_select do
    ["2 1/16": 2.0625]
  end
end
