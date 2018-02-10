defmodule PartywaveWeb.SurfboardController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews
  alias Partywave.Reviews.Surfboard
  alias Partywave.Reviews.Review

  plug Coherence.Authentication.Session, [protected: true] when not action in [:index, :show]
  plug PartywaveWeb.CheckAuthorization, %{} when not action in [:index, :show]

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
    current_user_id_string = Integer.to_string(conn.assigns.current_user.id)
    surfboard_current_user_params = Map.put(surfboard_params, "user_id", current_user_id_string)

    case Reviews.create_surfboard(surfboard_current_user_params) do
      {:ok, surfboard} ->
        conn
        |> put_flash(:info, "Surfboard created successfully.")
        |> redirect(to: surfboard_path(conn, :show, surfboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, shapers: shapers, categories: categories)
    end
  end

  def show(conn, %{"id" => id}) do
    changeset = Reviews.change_review(%Review{})
    surfboard = Reviews.get_surfboard!(id)
    reviews = Reviews.list_reviews()
    render(conn, "show.html", surfboard: surfboard, changeset: changeset, reviews: reviews)
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
