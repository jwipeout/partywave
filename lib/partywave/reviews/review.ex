defmodule Partywave.Reviews.Review do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Partywave.Reviews.Review
  alias Partywave.Repo


  schema "reviews" do
    field :body, :string
    field :rating, :integer, default: 0, null: false

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

      increment_surfboard_reviews_count(surfboard_id)
      update_surfboard_reviews_average_rating(surfboard_id)

      prepared_changeset
    end)
  end

  def increment_surfboard_reviews_count(surfboard_id) do
    from(s in Partywave.Reviews.Surfboard,
    where: s.id == ^surfboard_id)
    |> Repo.update_all(inc: [reviews_count: 1])
  end

  def update_surfboard_reviews_average_rating(surfboard_id) do
    reviews_average_rating =
      Repo.one from r in Review,
      where: r.surfboard_id == ^surfboard_id,
      select: avg(r.rating)

    rounded_reviews_average_rating = reviews_average_rating
    |> Decimal.to_float
    |> round()

    from(s in Partywave.Reviews.Surfboard,
    where: s.id == ^surfboard_id)
    |> Repo.update_all(set: [reviews_average_rating: rounded_reviews_average_rating])
  end
end
