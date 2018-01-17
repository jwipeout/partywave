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
end
