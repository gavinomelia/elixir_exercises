defmodule PizzaParty.D.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "must be a number" do
    assert_output(["abcm", "bobm", "10", "8"], "Please enter a valid amount.")
  end

  test "negative numbers" do
    assert_output(["-8", "-15", "10", "8"], "No negatives allowed.")
  end

  test "900 and 3" do
    assert_output(["900", "3"], "You need to buy 338 pizzas. When you do there will be 4.0 leftover pieces.")
  end

  test "24 and 1" do
    assert_output(["24", "1"], "You need to buy 3 pizzas. When you do there will be 0.0 leftover pieces.")
  end

  test "100 and 20" do
    assert_output(["100", "20"], "You need to buy 250 pizzas. When you do there will be 0.0 leftover pieces.")
  end

  defp assert_output(list_of_strings, output) do
    assert String.contains?(captured(Enum.join(list_of_strings, "\n")), output)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &PizzaParty.D.go/0) |> String.strip
  end

end
