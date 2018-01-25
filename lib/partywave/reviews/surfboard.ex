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
    field :width_ratio, :string, virtual: true

    belongs_to :category, Partywave.Reviews.Category
    belongs_to :shaper, Partywave.Reviews.Shaper

    timestamps()
  end

  @doc false
  def changeset(%Surfboard{} = surfboard, attrs) do
    surfboard
    |> cast(attrs, [:model, :length, :thickness, :volume, :shaper_id, :width_ratio])
    |> validate_required([:model, :length, :thickness, :volume, :width_ratio])
    |> convert_width_ratio_to_inches()
    |> unique_constraint(:model)
    |> assoc_constraint(:shaper)
  end

  def convert_width_ratio_to_inches(changeset) do
    width_ratio = get_field(changeset, :width_ratio)

    cond do
      width_ratio ->
        width_inches = convert_ratio_to_inches(width_ratio)
        put_change(changeset, :width, width_inches)

      true ->
        changeset
    end
  end

  def convert_ratio_to_inches(ratio_string) do
    [whole_number, ratio] = String.split(ratio_string, " ")
    [numerator, denominator] = String.split(ratio, "/")
    whole_number_integer = String.to_integer(whole_number)
    numerator_integer = String.to_integer(numerator)
    denominator_integer = String.to_integer(denominator)
    whole_number_integer + (numerator_integer / denominator_integer)
  end

  def inches_decimal_to_ratio(decimal) do
    inches_string = Float.to_string(decimal)
    [whole_number, ratio] = String.split(inches_string, ".")
    ratio_to_float = String.to_float("0.#{ratio}")
    {numerator, denominator} = Float.ratio(ratio_to_float)
    "#{whole_number} #{numerator}/#{denominator}"
  end

  def width_select do
    ["2 1/8", "2 1/4"]
  end

  def thickness_select do
    [
      2.0625,
      2.125,
      2.1875,
      2.25,
      2.3125,
      2.375,
      2.4375,
      2.5,
      2.5625,
      2.625,
      2.6875,
      2.75,
      2.8125,
      2.9375
    ] |>
      Enum.map(&({inches_decimal_to_ratio(&1), &1}))
  end
end
