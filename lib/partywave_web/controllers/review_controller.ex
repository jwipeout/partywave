defmodule PartywaveWeb.ReviewController do
  use PartywaveWeb, :controller

  alias Partywave.Reviews
  alias Partywave.Reviews.Review

  plug Coherence.Authentication.Session, [protected: true] when not action in [:index, :show]

  def index(conn, %{"surfboard_id" => surfboard_id}) do
    surfboard = Reviews.get_surfboard!(surfboard_id)
    render(conn, "index.html", surfboard: surfboard)
  end

  def new(conn, _params) do
    changeset = Reviews.change_review(%Review{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"review" => review_params}) do
    current_user_id_string = Integer.to_string(conn.assigns.current_user.id)
    review_current_user_params = Map.put(review_params, "user_id", current_user_id_string)

    case Reviews.create_review(review_current_user_params) do
      {:ok, review} ->
        t = Partywave.Repo.preload review, :surfboard

        conn
        |> put_flash(:info, "Review created successfully.")
        |> redirect(to: surfboard_path(conn, :show, t.surfboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    review = Reviews.get_review!(id)
    render(conn, "show.html", review: review)
  end

  def edit(conn, %{"id" => id}) do
    review = Reviews.get_review!(id)
    changeset = Reviews.change_review(review)
    render(conn, "edit.html", review: review, changeset: changeset)
  end

  def update(conn, %{"id" => id, "review" => review_params}) do
    review = Reviews.get_review!(id)

    case Reviews.update_review(review, review_params) do
      {:ok, review} ->
        conn
        |> put_flash(:info, "Review updated successfully.")
        |> redirect(to: review_path(conn, :show, review))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", review: review, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    review = Reviews.get_review!(id)
    {:ok, _review} = Reviews.delete_review(review)

    conn
    |> put_flash(:info, "Review deleted successfully.")
    |> redirect(to: review_path(conn, :index))
  end
end
