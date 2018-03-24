defmodule PartywaveWeb.DateHelper do
  def format_date(date) do
    Timex.format!(date, "%B %e, %Y", :strftime)
  end

  def format_date(nil) do
    "unavailable"
  end
end
