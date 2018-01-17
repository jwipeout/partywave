defmodule PartywaveWeb.ShaperControllerTest do
  use PartywaveWeb.ConnCase

  alias Partywave.Reviews

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:shaper) do
    {:ok, shaper} = Reviews.create_shaper(@create_attrs)
    shaper
  end

  describe "index" do
    test "lists all shapers", %{conn: conn} do
      conn = get conn, shaper_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Shapers"
    end
  end

  describe "new shaper" do
    test "renders form", %{conn: conn} do
      conn = get conn, shaper_path(conn, :new)
      assert html_response(conn, 200) =~ "New Shaper"
    end
  end

  describe "create shaper" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, shaper_path(conn, :create), shaper: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == shaper_path(conn, :show, id)

      conn = get conn, shaper_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Shaper"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, shaper_path(conn, :create), shaper: @invalid_attrs
      assert html_response(conn, 200) =~ "New Shaper"
    end
  end

  describe "edit shaper" do
    setup [:create_shaper]

    test "renders form for editing chosen shaper", %{conn: conn, shaper: shaper} do
      conn = get conn, shaper_path(conn, :edit, shaper)
      assert html_response(conn, 200) =~ "Edit Shaper"
    end
  end

  describe "update shaper" do
    setup [:create_shaper]

    test "redirects when data is valid", %{conn: conn, shaper: shaper} do
      conn = put conn, shaper_path(conn, :update, shaper), shaper: @update_attrs
      assert redirected_to(conn) == shaper_path(conn, :show, shaper)

      conn = get conn, shaper_path(conn, :show, shaper)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, shaper: shaper} do
      conn = put conn, shaper_path(conn, :update, shaper), shaper: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Shaper"
    end
  end

  describe "delete shaper" do
    setup [:create_shaper]

    test "deletes chosen shaper", %{conn: conn, shaper: shaper} do
      conn = delete conn, shaper_path(conn, :delete, shaper)
      assert redirected_to(conn) == shaper_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, shaper_path(conn, :show, shaper)
      end
    end
  end

  defp create_shaper(_) do
    shaper = fixture(:shaper)
    {:ok, shaper: shaper}
  end
end
