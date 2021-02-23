defmodule Rocketpay.Rocket do
  def rocket_string some_string do
    cond do
      some_string == "rocketseat" ->
        {:ok, "Nice, you found an easter egg!"}
      some_string == "nope" ->
        {:empty, "The string cannot be 'nope'"}
      true ->
        {:error, "...ok."}
    end
  end
end
