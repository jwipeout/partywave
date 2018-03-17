defmodule PartywaveWeb.SurfboardHelper do
  import Phoenix.HTML.Tag
  import PartywaveWeb.NumberHelper

  def reviews_count(count) do
    "#{count} reviews"
  end

  def reviews_average_rating(average_rating) do
    content_tag :div do
      [
        content_tag(:i, "", class: "fa fa-thermometer-half rating_icon"),
        content_tag(:span, number_to_percent(average_rating))
      ]
    end
  end

  def our_rating(rating) do
    content_tag :div do
      [
        content_tag(:i, "", class: "fa fa-hand-rock-o rating_icon"),
        content_tag(:span, number_to_percent(rating))
      ]
    end
  end
end
