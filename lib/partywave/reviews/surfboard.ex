defmodule Partywave.Reviews.Surfboard do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset

  alias Partywave.Reviews.Surfboard


  schema "surfboards" do
    field :length, :integer
    field :length_feet, :string, virtual: true
    field :model, :string
    field :thickness, :float
    field :thickness_ratio, :string, virtual: true
    field :volume, :float
    field :width, :float
    field :width_ratio, :string, virtual: true
    field :image, PartywaveWeb.SurfboardImage.Type

    belongs_to :category, Partywave.Reviews.Category
    belongs_to :shaper, Partywave.Reviews.Shaper
    belongs_to :user, Partywave.Coherence.User

    timestamps()
  end

  @doc false
  def changeset(%Surfboard{} = surfboard, attrs) do
    surfboard
    |> cast(attrs, [:model, :length_feet, :volume, :shaper_id, :user_id, :width_ratio, :category_id, :thickness_ratio])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:model, :length_feet, :volume, :width_ratio, :shaper_id, :user_id, :category_id, :thickness_ratio])
    |> convert_length_feet_to_inches()
    |> convert_width_ratio_to_inches()
    |> convert_thickness_ratio_to_inches()
    |> unique_constraint(:model)
    |> assoc_constraint(:shaper)
    |> assoc_constraint(:category)
    |> assoc_constraint(:user)
  end

  def convert_length_feet_to_inches(changeset) do
    length_feet = get_field(changeset, :length_feet)

    cond do
      length_feet ->
        length_inches = convert_feet_to_inches(length_feet)
        put_change(changeset, :length, length_inches)

      true ->
        changeset
    end
  end

  def convert_feet_to_inches(feet_string) do
    cond do
      String.split(feet_string, " ")
      |> length() == 1 ->
        [feet, feet_prime] = String.split(feet_string, "'")
        String.to_integer(feet) * 12

      true ->
        [feet_split, inches_split] = String.split(feet_string, " ")
        [feet, feet_prime] = String.split(feet_split, "'")
        feet_integer = String.to_integer(feet)
        inches_integer = String.to_integer(inches_split)
        (feet_integer * 12) + inches_integer
    end
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

  def convert_thickness_ratio_to_inches(changeset) do
    thickness_ratio = get_field(changeset, :thickness_ratio)

    cond do
      thickness_ratio ->
        thickness_inches = convert_ratio_to_inches(thickness_ratio)
        put_change(changeset, :thickness, thickness_inches)

      true ->
        changeset
    end
  end

  def convert_ratio_to_inches(ratio_string) do
    cond do
      String.split(ratio_string, " ")
      |> length() == 1 ->
        String.to_float("#{ratio_string}.0")

      true ->
        [whole_number, ratio] = String.split(ratio_string, " ")
        [numerator, denominator] = String.split(ratio, "/")
        whole_number_integer = String.to_integer(whole_number)
        numerator_integer = String.to_integer(numerator)
        denominator_integer = String.to_integer(denominator)
        whole_number_integer + (numerator_integer / denominator_integer)
    end
  end
end
