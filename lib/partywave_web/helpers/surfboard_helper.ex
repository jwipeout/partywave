defmodule PartywaveWeb.SurfboardHelper do
  import Phoenix.HTML.Tag
  import PartywaveWeb.NumberHelper

  def reviews_count(count) do
    "#{count} reviews"
  end

  def reviews_average_rating(average_rating) do
    rating = if (average_rating == 0), do: "No Review", else: number_to_percent(average_rating)

    content_tag :div do
      [
        content_tag(:i, "", class: "fa fa-thermometer-half rating_icon"),
        content_tag(:span, rating)
      ]
    end
  end

  def our_rating(rating) do
    our_rating = if (rating == 0), do: "No Review", else: number_to_percent(rating)

    content_tag :div do
      [
        content_tag(:i, "", class: "fa fa-hand-rock-o rating_icon"),
        content_tag(:span, our_rating)
      ]
    end
  end
end
