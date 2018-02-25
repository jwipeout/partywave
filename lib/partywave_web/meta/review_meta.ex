defmodule PartywaveWeb.ReviewMeta do
  defmacro __using__(_) do
    quote do
      def title("index.html", assigns) do
        "#{assigns.surfboard.shaper.name} #{assigns.surfboard.model} surfboard reviews"
      end
    end
  end
end
