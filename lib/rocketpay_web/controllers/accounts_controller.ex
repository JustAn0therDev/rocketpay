defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.Account.Deposit.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", account: account)
    end
  end
end
