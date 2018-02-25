defmodule PartywaveWeb.MetaDefaults do
  defmacro __using__(_) do
    quote do
      def title(_view_template, _assigns) do
        "Default Title"
      end

      defoverridable [title: 2]
    end
  end
end
