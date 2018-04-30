defmodule PartywaveWeb.SurfboardView do
  use PartywaveWeb, :view

  import Scrivener.HTML
  import PartywaveWeb.SurfboardHelper
  import PartywaveWeb.DateHelper
  import PartywaveWeb.UserHelper

  def length_select do
    [
      "6' 0",
      "5' 1"
    ]
  end

  def width_select do
    [
      "18",
      "18 1/16",
      "18 1/8",
      "18 3/16",
      "18 1/4",
      "18 5/16",
      "18 7/16",
      "18 1/2",
      "18 9/16",
      "18 5/8",
      "18 11/16",
      "18 3/4",
      "18 13/16",
      "18 7/8",
      "18 15/16",
      "19",
      "19 1/16",
      "19 1/8",
      "19 3/16",
      "19 1/4",
      "19 5/16",
      "19 7/16",
      "19 1/2",
      "19 9/16",
      "19 5/8",
      "19 11/16",
      "19 3/4",
      "19 13/16",
      "19 7/8",
      "19 15/16",
      "20",
      "20 1/16",
      "20 1/8",
      "20 3/16",
      "20 1/4",
      "20 5/16",
      "20 7/16",
      "20 1/2",
      "20 9/16",
      "20 5/8",
      "20 11/16",
      "20 3/4",
      "20 13/16",
      "20 7/8",
      "20 15/16",
      "21"
    ]
  end

  def thickness_select do
    [
      "2",
      "2 1/16",
      "2 1/8",
      "2 3/16",
      "2 1/4",
      "2 5/16",
      "2 7/16",
      "2 1/2",
      "2 9/16",
      "2 5/8",
      "2 11/16",
      "2 3/4",
      "2 13/16",
      "2 7/8",
      "2 15/16",
      "3"
    ]
  end

  def inches_decimal_to_ratio(nil) do
  end

  def inches_decimal_to_ratio(decimal) do
    {_num, denom} = Float.ratio(decimal)
    inches_string = Float.to_string(decimal)
    [whole_number, ratio] = String.split(inches_string, ".")

    cond do
      denom == 1 ->
        whole_number

      true ->
        ratio_to_float = String.to_float("0.#{ratio}")
        {numerator, denominator} = Float.ratio(ratio_to_float)
        "#{whole_number} #{numerator}/#{denominator}"
    end
  end

  def inches_to_feet(nil) do
  end

  def inches_to_feet(inches) do
    feet = trunc(inches / 12)
    rem_inches = rem(inches, 12)
    "#{feet}' #{rem_inches}"
  end

  def new_review(conn, assigns, nil) do
    content_tag :div do
      [
        content_tag(:a, "Sign in", href: session_path(conn, :new)),
        content_tag(:span, " to leave a surfboard review.")
      ]
    end
  end

  def new_review(conn, assigns, _current_user) do
    render PartywaveWeb.ReviewView, "new.html", Map.put(assigns, :action, review_path(conn, :create))
  end
end
