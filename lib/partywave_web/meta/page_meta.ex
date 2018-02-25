defmodule PartywaveWeb.PageMeta do
  defmacro __using__(_) do
    quote do
      def title("index.html", _assigns) do
        "hey yo"
      end
    end
  end
end
