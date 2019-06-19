defmodule QuicksilverWeb.Resolvers.Accounts do
  alias Quicksilver.Accounts
  alias QuicksilverWeb.Schema.ChangesetErrors

  def signin(_, %{email: email, password: password}, _) do
    case Accounts.authenticate(email, password) do
      :error ->
        {:error, "Invalid Credentials"}

      {:ok, user} ->
        token = QuicksilverWeb.AuthToken.sign(user)
        {:ok, %{token: token, user: user}}
    end
  end

  def signup(_, args, _) do
    case Accounts.create_user(args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create account", details: ChangesetErrors.error_details(changeset)
        }

      {:ok, user} ->
        token = QuicksilverWeb.AuthToken.sign(user)
        {:ok, %{token: token, user: user}}
    end
  end

  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end
