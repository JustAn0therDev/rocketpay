defmodule RocketpayWeb.FallbackController do
  use RocketpayWeb, :controller

  # "call" is a default name for "fallback controller" actions
  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
