# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Partywave.Repo.insert!(%Partywave.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Partywave.Repo.delete_all Partywave.Coherence.User

Partywave.Coherence.User.changeset(
  %Partywave.Coherence.User{},
  %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"}
)
|> Partywave.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
