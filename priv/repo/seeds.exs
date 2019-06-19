# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Quicksilver.Repo
alias Quicksilver.Accounts.User

%User{}
|> User.changeset(%{
  email: "admin@example.com",
  password: "password"
})
|> Repo.insert!()
