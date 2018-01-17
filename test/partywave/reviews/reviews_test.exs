defmodule Partywave.ReviewsTest do
  use Partywave.DataCase

  alias Partywave.Reviews

  describe "shapers" do
    alias Partywave.Reviews.Shaper

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def shaper_fixture(attrs \\ %{}) do
      {:ok, shaper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reviews.create_shaper()

      shaper
    end

    test "list_shapers/0 returns all shapers" do
      shaper = shaper_fixture()
      assert Reviews.list_shapers() == [shaper]
    end

    test "get_shaper!/1 returns the shaper with given id" do
      shaper = shaper_fixture()
      assert Reviews.get_shaper!(shaper.id) == shaper
    end

    test "create_shaper/1 with valid data creates a shaper" do
      assert {:ok, %Shaper{} = shaper} = Reviews.create_shaper(@valid_attrs)
      assert shaper.name == "some name"
    end

    test "create_shaper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reviews.create_shaper(@invalid_attrs)
    end

    test "update_shaper/2 with valid data updates the shaper" do
      shaper = shaper_fixture()
      assert {:ok, shaper} = Reviews.update_shaper(shaper, @update_attrs)
      assert %Shaper{} = shaper
      assert shaper.name == "some updated name"
    end

    test "update_shaper/2 with invalid data returns error changeset" do
      shaper = shaper_fixture()
      assert {:error, %Ecto.Changeset{}} = Reviews.update_shaper(shaper, @invalid_attrs)
      assert shaper == Reviews.get_shaper!(shaper.id)
    end

    test "delete_shaper/1 deletes the shaper" do
      shaper = shaper_fixture()
      assert {:ok, %Shaper{}} = Reviews.delete_shaper(shaper)
      assert_raise Ecto.NoResultsError, fn -> Reviews.get_shaper!(shaper.id) end
    end

    test "change_shaper/1 returns a shaper changeset" do
      shaper = shaper_fixture()
      assert %Ecto.Changeset{} = Reviews.change_shaper(shaper)
    end
  end
end
