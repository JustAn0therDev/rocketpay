defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  # underscore at the beginning of a parameter name makes it optional
  def index(connection, %{"filename" => filename}) do
    filename
    |> Rocketpay.Numbers.sum_from_file()
    |> handle_response(connection)
  end

  defp handle_response({:ok, %{result: result}}, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here is your number: #{result}"})
  end

  defp handle_response({:error, reason}, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: reason})
  end

end
