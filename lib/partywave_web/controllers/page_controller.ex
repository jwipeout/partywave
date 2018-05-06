defmodule PartywaveWeb.PageController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews

  def index(conn, _params) do
    most_recent_surfboards = Reviews.most_recent_surfboards()
    most_recent_reviews = Reviews.most_recent_reviews()

    render(
      conn,
      "index.html",
      most_recent_surfboards: most_recent_surfboards,
      most_recent_reviews: most_recent_reviews
    )
  end
end
