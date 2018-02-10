defmodule Partywave.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset
  alias Partywave.Reviews.Review


  schema "reviews" do
    field :body, :string
    field :rating, :integer

    belongs_to :user, Partywave.Coherence.User
    belongs_to :surfboard, Partywave.Reviews.Surfboard

    timestamps()
  end

  @doc false
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, [:body, :rating, :surfboard_id, :user_id])
    |> validate_required([:body, :rating, :surfboard_id])
    |> validate_inclusion(:rating, 0..100)
    |> assoc_constraint(:user)
    |> assoc_constraint(:surfboard)
  end
end
