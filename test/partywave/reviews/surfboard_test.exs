defmodule Partywave.Reviews.SurfboardTest do
  use Partywave.DataCase

  alias Partywave.Reviews.Surfboard

  test "inches_decimal_to_ratio/1 returns inches in fraction form" do
    assert Surfboard.inches_decimal_to_ratio(2.75) == "2 3/4"
  end
end
