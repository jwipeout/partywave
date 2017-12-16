defmodule PartywaveWeb.PageController do
  use PartywaveWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
