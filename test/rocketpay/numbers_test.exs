defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when a file exists, returns the sum of its numbers" do
      {:ok, %{result: result}} = Numbers.sum_from_file("numbers")
      assert result == 37
    end

    test "when a file does not exist, returns an error with a reason" do
      {:error, reason} = Numbers.sum_from_file("banana")
      assert "Invalid file" == reason
    end
  end
end
