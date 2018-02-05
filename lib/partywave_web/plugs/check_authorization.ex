defmodule PartywaveWeb.CheckAuthorization do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do
    cond do
      conn.assigns.current_user.role == "admin" ->
        conn

      true ->
        conn
        |> Phoenix.Controller.put_flash(:warning, "User does not have permission.")
        |> Phoenix.Controller.redirect(to: PartywaveWeb.Router.Helpers.page_path(conn, :index))
        |> halt
    end
  end
end
