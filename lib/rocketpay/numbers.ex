# EVERYTHING IN ELIXIR AT THE LAST LINE IS AN IMPLICIT RETURN STATEMENT.

# everything is immutable as well. Nothing here is passed by reference or is a pointer;
# all we have are values and passing by values, so that's why we "chain" functions

defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, numbers_separated_by_comma}) do
    result = numbers_separated_by_comma
    |> String.split(",")
    |> Enum.map(fn number_string -> String.to_integer(number_string) end)
    |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, "Invalid file"}
end
