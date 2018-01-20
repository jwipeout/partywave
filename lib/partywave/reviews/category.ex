defmodule Partywave.Reviews.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Partywave.Reviews.Category


  schema "categories" do
    field :name, :string

    has_many :surfboards, Partywave.Reviews.Surfboard

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
