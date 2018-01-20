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

  describe "categories" do
    alias Partywave.Reviews.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reviews.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Reviews.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Reviews.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Reviews.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reviews.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Reviews.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Reviews.update_category(category, @invalid_attrs)
      assert category == Reviews.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Reviews.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Reviews.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Reviews.change_category(category)
    end
  end

  describe "surfboards" do
    alias Partywave.Reviews.Surfboard

    @valid_attrs %{length: 42, model: "some model", thickness: 120.5, volume: 120.5, width: 120.5}
    @update_attrs %{length: 43, model: "some updated model", thickness: 456.7, volume: 456.7, width: 456.7}
    @invalid_attrs %{length: nil, model: nil, thickness: nil, volume: nil, width: nil}

    def surfboard_fixture(attrs \\ %{}) do
      {:ok, surfboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reviews.create_surfboard()

      surfboard
    end

    test "list_surfboards/0 returns all surfboards" do
      surfboard = surfboard_fixture()
      assert Reviews.list_surfboards() == [surfboard]
    end

    test "get_surfboard!/1 returns the surfboard with given id" do
      surfboard = surfboard_fixture()
      assert Reviews.get_surfboard!(surfboard.id) == surfboard
    end

    test "create_surfboard/1 with valid data creates a surfboard" do
      assert {:ok, %Surfboard{} = surfboard} = Reviews.create_surfboard(@valid_attrs)
      assert surfboard.length == 42
      assert surfboard.model == "some model"
      assert surfboard.thickness == 120.5
      assert surfboard.volume == 120.5
      assert surfboard.width == 120.5
    end

    test "create_surfboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reviews.create_surfboard(@invalid_attrs)
    end

    test "update_surfboard/2 with valid data updates the surfboard" do
      surfboard = surfboard_fixture()
      assert {:ok, surfboard} = Reviews.update_surfboard(surfboard, @update_attrs)
      assert %Surfboard{} = surfboard
      assert surfboard.length == 43
      assert surfboard.model == "some updated model"
      assert surfboard.thickness == 456.7
      assert surfboard.volume == 456.7
      assert surfboard.width == 456.7
    end

    test "update_surfboard/2 with invalid data returns error changeset" do
      surfboard = surfboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Reviews.update_surfboard(surfboard, @invalid_attrs)
      assert surfboard == Reviews.get_surfboard!(surfboard.id)
    end

    test "delete_surfboard/1 deletes the surfboard" do
      surfboard = surfboard_fixture()
      assert {:ok, %Surfboard{}} = Reviews.delete_surfboard(surfboard)
      assert_raise Ecto.NoResultsError, fn -> Reviews.get_surfboard!(surfboard.id) end
    end

    test "change_surfboard/1 returns a surfboard changeset" do
      surfboard = surfboard_fixture()
      assert %Ecto.Changeset{} = Reviews.change_surfboard(surfboard)
    end
  end
end
