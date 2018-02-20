defmodule PartywaveWeb.ReviewHelper do
  def ratings_percent(reviews) do
    ratings = Enum.map(reviews, fn(review) -> review.rating end)
    ratings_count = length(ratings)
    ratings_sum = Enum.sum(ratings)
    ratings_sum / ratings_count
    |> round
  end
end
