defmodule PartywaveWeb.SurfboardControllerTest do
  use PartywaveWeb.ConnCase

  alias Partywave.Reviews

  @create_attrs %{length: 42, model: "some model", thickness: 120.5, volume: 120.5, width: 120.5}
  @update_attrs %{length: 43, model: "some updated model", thickness: 456.7, volume: 456.7, width: 456.7}
  @invalid_attrs %{length: nil, model: nil, thickness: nil, volume: nil, width: nil}

  def fixture(:surfboard) do
    {:ok, surfboard} = Reviews.create_surfboard(@create_attrs)
    surfboard
  end

  describe "index" do
    test "lists all surfboards", %{conn: conn} do
      conn = get conn, surfboard_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Surfboards"
    end
  end

  describe "new surfboard" do
    test "renders form", %{conn: conn} do
      conn = get conn, surfboard_path(conn, :new)
      assert html_response(conn, 200) =~ "New Surfboard"
    end
  end

  describe "create surfboard" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, surfboard_path(conn, :create), surfboard: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == surfboard_path(conn, :show, id)

      conn = get conn, surfboard_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Surfboard"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, surfboard_path(conn, :create), surfboard: @invalid_attrs
      assert html_response(conn, 200) =~ "New Surfboard"
    end
  end

  describe "edit surfboard" do
    setup [:create_surfboard]

    test "renders form for editing chosen surfboard", %{conn: conn, surfboard: surfboard} do
      conn = get conn, surfboard_path(conn, :edit, surfboard)
      assert html_response(conn, 200) =~ "Edit Surfboard"
    end
  end

  describe "update surfboard" do
    setup [:create_surfboard]

    test "redirects when data is valid", %{conn: conn, surfboard: surfboard} do
      conn = put conn, surfboard_path(conn, :update, surfboard), surfboard: @update_attrs
      assert redirected_to(conn) == surfboard_path(conn, :show, surfboard)

      conn = get conn, surfboard_path(conn, :show, surfboard)
      assert html_response(conn, 200) =~ "some updated model"
    end

    test "renders errors when data is invalid", %{conn: conn, surfboard: surfboard} do
      conn = put conn, surfboard_path(conn, :update, surfboard), surfboard: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Surfboard"
    end
  end

  describe "delete surfboard" do
    setup [:create_surfboard]

    test "deletes chosen surfboard", %{conn: conn, surfboard: surfboard} do
      conn = delete conn, surfboard_path(conn, :delete, surfboard)
      assert redirected_to(conn) == surfboard_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, surfboard_path(conn, :show, surfboard)
      end
    end
  end

  defp create_surfboard(_) do
    surfboard = fixture(:surfboard)
    {:ok, surfboard: surfboard}
  end
end
