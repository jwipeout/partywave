defmodule PartywaveWeb.ShaperController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews
  alias Partywave.Reviews.Shaper

  plug Coherence.Authentication.Session, [protected: true] when not action in [:index, :show]

  def index(conn, _params) do
    shapers = Reviews.list_shapers()
    render(conn, "index.html", shapers: shapers)
  end

  def new(conn, _params) do
    changeset = Reviews.change_shaper(%Shaper{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shaper" => shaper_params}) do
    case Reviews.create_shaper(shaper_params) do
      {:ok, shaper} ->
        conn
        |> put_flash(:info, "Shaper created successfully.")
        |> redirect(to: shaper_path(conn, :show, shaper))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shaper = Reviews.get_shaper!(id)
    render(conn, "show.html", shaper: shaper)
  end

  def edit(conn, %{"id" => id}) do
    shaper = Reviews.get_shaper!(id)
    changeset = Reviews.change_shaper(shaper)
    render(conn, "edit.html", shaper: shaper, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shaper" => shaper_params}) do
    shaper = Reviews.get_shaper!(id)

    case Reviews.update_shaper(shaper, shaper_params) do
      {:ok, shaper} ->
        conn
        |> put_flash(:info, "Shaper updated successfully.")
        |> redirect(to: shaper_path(conn, :show, shaper))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", shaper: shaper, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shaper = Reviews.get_shaper!(id)
    {:ok, _shaper} = Reviews.delete_shaper(shaper)

    conn
    |> put_flash(:info, "Shaper deleted successfully.")
    |> redirect(to: shaper_path(conn, :index))
  end
end
