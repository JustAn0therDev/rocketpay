defmodule Rocketpay.User.Create do
  alias Rocketpay.{Repo, User}

  def create_user params do
    params
    |> User.changeset
    |> Repo.insert
  end
end
