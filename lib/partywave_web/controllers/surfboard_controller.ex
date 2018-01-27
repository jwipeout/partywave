defmodule PartywaveWeb.SurfboardController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews
  alias Partywave.Reviews.Surfboard

  def index(conn, _params) do
    surfboards = Reviews.list_surfboards()
    categories = Reviews.list_categories()
    render(conn, "index.html", surfboards: surfboards, categories: categories)
  end

  def new(conn, _params) do
    shapers = Reviews.list_shapers()
    categories = Reviews.list_categories()
    changeset = Reviews.change_surfboard(%Surfboard{})

    render(conn, "new.html", changeset: changeset, shapers: shapers, categories: categories)
  end

  def create(conn, %{"surfboard" => surfboard_params}) do
    shapers = Reviews.list_shapers()
    categories = Reviews.list_categories()

    case Reviews.create_surfboard(surfboard_params) do
      {:ok, surfboard} ->
        conn
        |> put_flash(:info, "Surfboard created successfully.")
        |> redirect(to: surfboard_path(conn, :show, surfboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, shapers: shapers, categories: categories)
    end
  end

  def show(conn, %{"id" => id}) do
    surfboard = Reviews.get_surfboard!(id)
    render(conn, "show.html", surfboard: surfboard)
  end

  def edit(conn, %{"id" => id}) do
    shapers = Reviews.list_shapers()
    categories = Reviews.list_categories()
    surfboard = Reviews.get_surfboard!(id)
    changeset = Reviews.change_surfboard(surfboard)

    render(conn, "edit.html", surfboard: surfboard, changeset: changeset, shapers: shapers, categories: categories)
  end

  def update(conn, %{"id" => id, "surfboard" => surfboard_params}) do
    shapers = Reviews.list_shapers()
    categories = Reviews.list_categories()
    surfboard = Reviews.get_surfboard!(id)

    case Reviews.update_surfboard(surfboard, surfboard_params) do
      {:ok, surfboard} ->
        conn
        |> put_flash(:info, "Surfboard updated successfully.")
        |> redirect(to: surfboard_path(conn, :show, surfboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", surfboard: surfboard, changeset: changeset, shapers: shapers, categories: categories)
    end
  end

  def delete(conn, %{"id" => id}) do
    surfboard = Reviews.get_surfboard!(id)
    {:ok, _surfboard} = Reviews.delete_surfboard(surfboard)

    conn
    |> put_flash(:info, "Surfboard deleted successfully.")
    |> redirect(to: surfboard_path(conn, :index))
  end
end
