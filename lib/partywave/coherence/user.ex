defmodule Partywave.Coherence.User do
  @moduledoc false
  use Ecto.Schema
  use Coherence.Schema



  schema "users" do
    field :name, :string
    field :email, :string
    field :role, :string

    coherence_schema()

    has_many :surfboards, Partywave.Reviews.Surfboard

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :role] ++ coherence_fields())
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end

  def changeset(model, params, :password) do
    model
    |> cast(params, ~w(password password_confirmation reset_password_token reset_password_sent_at))
    |> validate_coherence_password_reset(params)
  end
end
