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

  def rating_tooltip(title) do
    content_tag(:span, class: "rating_tooltip") do
      [
        content_tag(
          :i,
          "",
          class: "fa fa-question-circle-o",
          aria: [
            hidden: "true"
          ],
          data: [
            toggle: "tooltip",
            placement: "top"
          ],
          title: title
        )
      ]
    end
    # span.rating_tooltip
    #   i.fa.fa-question-circle-o aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Score given by PartyWave"
  end

  def main_image(surfboard, :medium) do
    PartywaveWeb.SurfboardImage.url({surfboard.image, surfboard}, :medium)
  end

  def main_image(surfboard) do
    PartywaveWeb.SurfboardImage.url({surfboard.image, surfboard})
  end
end
