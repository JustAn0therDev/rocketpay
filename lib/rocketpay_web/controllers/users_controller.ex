defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(connection, params) do
    # a "with" statement can be a pipeline (calling more statements in a queue)
    # resembles promises when using "then" and "catch".
    with {:ok, %User{} = user} <- User.Create.create_user params do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
