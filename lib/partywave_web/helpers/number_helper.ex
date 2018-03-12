defmodule PartywaveWeb.NumberHelper do
  def number_to_percent(number) do
    "#{Integer.to_string(number)}%"
  end
end
