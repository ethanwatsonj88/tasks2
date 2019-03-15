# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tasks1.Repo.insert!(%Tasks1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tasks1.Repo
alias Tasks1.Users.User

Repo.insert!(%User{email: "ethan@gmail.com", name: "ethan",
										is_manager: true})
Repo.insert!(%User{email: "justin@gmail.com", name: "justin",
										is_manager: false, manager_id: 1})
