defmodule QuicksilverWeb.Schema.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)

  alias QuicksilverWeb.Resolvers
  alias Quicksilver.Accounts

  query do
    @desc "Get the currently signed-in user"
    field :me, :user do
      resolve(&Resolvers.Accounts.me/3)
    end
  end

  mutation do
    @desc "Create a user account"
    field :signup, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Accounts.signup/3)
    end

    @desc "Sign in a user"
    field :signin, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Accounts.signin/3)
    end
  end

  #
  # Object Types
  #

  object :session do
    field :token, non_null(:string)
    field :user, non_null(:user)
  end

  object :user do
    field :email, non_null(:string)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Accounts, Accounts.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
