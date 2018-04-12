require Logger

defmodule Partywave.Reviews.Review do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Partywave.Reviews.Review
  alias Partywave.Repo

  schema "reviews" do
    field :body, :string
    field :rating, :integer, default: 0, null: false
    field :title, :string

    belongs_to :user, Partywave.Coherence.User
    belongs_to :surfboard, Partywave.Reviews.Surfboard

    timestamps()
  end

  @doc false
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, [:body, :rating, :surfboard_id, :user_id, :title])
    |> validate_required([:body, :rating, :surfboard_id, :title])
    |> validate_inclusion(:rating, 0..100)
    |> unique_constraint(
      :title,
      name: :unique_review_per_surfboard,
      message: "You already reviewed this."
    )
    |> assoc_constraint(:user)
    |> assoc_constraint(:surfboard)
    |> prepare_changes(fn prepared_changeset ->
      surfboard_id = prepared_changeset.changes.surfboard_id
      review_rating = prepared_changeset.changes.rating

      increment_surfboard_reviews_count(surfboard_id)
      update_surfboard_reviews_average_rating(surfboard_id, review_rating)

      prepared_changeset
    end)
  end

  def increment_surfboard_reviews_count(surfboard_id) do
    from(s in Partywave.Reviews.Surfboard,
    where: s.id == ^surfboard_id)
    |> Repo.update_all(inc: [reviews_count: 1])
  end

  def update_surfboard_reviews_average_rating(surfboard_id, review_rating) do
    reviews_average_rating =
      Repo.one from r in Review,
      where: r.surfboard_id == ^surfboard_id,
      select: {sum(r.rating), count("*")}

    rounded_reviews_average_rating =
      reviews_average_rating
      |> add_review_to_reviews_rating(review_rating)
      |> calculate_average_rating

    from(s in Partywave.Reviews.Surfboard,
    where: s.id == ^surfboard_id)
    |> Repo.update_all(set: [reviews_average_rating: rounded_reviews_average_rating])
  end

  def add_review_to_reviews_rating({rating_sum, reviews_count}, review_rating) do
    cond do
      rating_sum ->
        {rating_sum + review_rating, reviews_count + 1}

      true ->
        {0 + review_rating, reviews_count + 1}
    end
  end

  def calculate_average_rating({rating_sum, reviews_count}) do
    rating_sum / reviews_count
    |> round
  end
end
