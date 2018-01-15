defmodule PartywaveWeb.LayoutView do
  use PartywaveWeb, :view

  def sign_in_links(nil, conn) do
    render "_sign_in_links.html", conn: conn
  end

  def sign_in_links(current_user, conn) do
    render "_sign_out_links.html", conn: conn
  end
end
