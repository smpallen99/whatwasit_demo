# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WhatwasitDemo.Repo.insert!(%WhatwasitDemo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

WhatwasitDemo.Repo.delete_all WhatwasitDemo.User

WhatwasitDemo.User.changeset(%WhatwasitDemo.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> WhatwasitDemo.Repo.insert!
