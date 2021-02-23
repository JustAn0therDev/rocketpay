defmodule RocketpayWeb.RocketStringController do
  use RocketpayWeb, :controller

  alias Rocketpay.Rocket

  def index(connection, %{"somestring" => some_string}) do
    some_string
    |> Rocket.rocket_string
    |> handle_response(connection)
  end

  defp handle_response({:ok, result}, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: result})
  end

  defp handle_response({:empty, result}, connection) do
    connection
    |> put_status(:bad_request)
    |> json(%{message: result})
  end

  defp handle_response({:error, result}, connection) do
    connection
    |> put_status(:internal_server_error)
    |> json(%{message: result})
  end
end
