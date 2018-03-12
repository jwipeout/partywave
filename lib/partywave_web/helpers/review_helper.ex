defmodule PartywaveWeb.ReviewHelper do
  import PartywaveWeb.NumberHelper

  def ratings_percent(reviews) do
    ratings = Enum.map(reviews, fn(review) -> review.rating end)
    ratings_count = length(ratings)
    ratings_sum = Enum.sum(ratings)
    ratings_sum / ratings_count
    |> round
    |> number_to_percent
  end
end
