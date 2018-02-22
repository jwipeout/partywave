defmodule Partywave.Reviews.Review do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Partywave.Reviews.Review
  alias Partywave.Repo


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
    |> prepare_changes(fn prepared_changeset ->
      surfboard_id = prepared_changeset.changes.surfboard_id

      from(s in Partywave.Reviews.Surfboard,
      where: s.id == ^surfboard_id)
      |> Repo.update_all(inc: [reviews_count: 1])

      prepared_changeset
    end)
  end
end
