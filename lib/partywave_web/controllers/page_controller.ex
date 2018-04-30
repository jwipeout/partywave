defmodule PartywaveWeb.PageController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews

  def index(conn, _params) do
    most_recent_surfboards = Reviews.most_recent_surfboards()
    render conn, "index.html", most_recent_surfboards: most_recent_surfboards
  end
end
