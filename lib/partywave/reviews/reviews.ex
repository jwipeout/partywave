defmodule Partywave.Reviews do
  @moduledoc """
  The Reviews context.
  """

  import Ecto.Query, warn: false
  alias Partywave.Repo

  alias Partywave.Reviews.Shaper

  @doc """
  Returns the list of shapers.

  ## Examples

      iex> list_shapers()
      [%Shaper{}, ...]

  """
  def list_shapers do
    Repo.all(Shaper)
  end

  @doc """
  Gets a single shaper.

  Raises `Ecto.NoResultsError` if the Shaper does not exist.

  ## Examples

      iex> get_shaper!(123)
      %Shaper{}

      iex> get_shaper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shaper!(id), do: Repo.get!(Shaper, id)

  @doc """
  Creates a shaper.

  ## Examples

      iex> create_shaper(%{field: value})
      {:ok, %Shaper{}}

      iex> create_shaper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shaper(attrs \\ %{}) do
    %Shaper{}
    |> Shaper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shaper.

  ## Examples

      iex> update_shaper(shaper, %{field: new_value})
      {:ok, %Shaper{}}

      iex> update_shaper(shaper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shaper(%Shaper{} = shaper, attrs) do
    shaper
    |> Shaper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Shaper.

  ## Examples

      iex> delete_shaper(shaper)
      {:ok, %Shaper{}}

      iex> delete_shaper(shaper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shaper(%Shaper{} = shaper) do
    Repo.delete(shaper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shaper changes.

  ## Examples

      iex> change_shaper(shaper)
      %Ecto.Changeset{source: %Shaper{}}

  """
  def change_shaper(%Shaper{} = shaper) do
    Shaper.changeset(shaper, %{})
  end

  alias Partywave.Reviews.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias Partywave.Reviews.Surfboard

  @doc """
  Returns the list of surfboards.

  ## Examples

      iex> list_surfboards()
      [%Surfboard{}, ...]

  """
  def list_surfboards do
    Repo.all from surfboard in Surfboard,
      preload: [:shaper, :category]
  end

  @doc """
  Gets a single surfboard.

  Raises `Ecto.NoResultsError` if the Surfboard does not exist.

  ## Examples

      iex> get_surfboard!(123)
      %Surfboard{}

      iex> get_surfboard!(456)
      ** (Ecto.NoResultsError)

  """
  def get_surfboard!(id), do: Repo.get!(Surfboard, id)

  @doc """
  Creates a surfboard.

  ## Examples

      iex> create_surfboard(%{field: value})
      {:ok, %Surfboard{}}

      iex> create_surfboard(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_surfboard(attrs \\ %{}) do
    %Surfboard{}
    |> Surfboard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a surfboard.

  ## Examples

      iex> update_surfboard(surfboard, %{field: new_value})
      {:ok, %Surfboard{}}

      iex> update_surfboard(surfboard, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_surfboard(%Surfboard{} = surfboard, attrs) do
    surfboard
    |> Surfboard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Surfboard.

  ## Examples

      iex> delete_surfboard(surfboard)
      {:ok, %Surfboard{}}

      iex> delete_surfboard(surfboard)
      {:error, %Ecto.Changeset{}}

  """
  def delete_surfboard(%Surfboard{} = surfboard) do
    Repo.delete(surfboard)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking surfboard changes.

  ## Examples

      iex> change_surfboard(surfboard)
      %Ecto.Changeset{source: %Surfboard{}}

  """
  def change_surfboard(%Surfboard{} = surfboard) do
    Surfboard.changeset(surfboard, %{})
  end
end
