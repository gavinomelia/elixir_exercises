defmodule PizzaParty.C.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "must be a number" do
    assert_output(["abcm", "bobm", "10", "8"], "Please enter a valid amount.")
  end

  test "negative numbers" do
    assert_output(["-8", "-15", "10", "8"], "No negatives allowed.")
  end

  test "10 and 4" do
    assert_output(["10", "4"], "Each person gets 3 pieces of pizza.\nThere are 2.0 leftover pieces.")
  end

  test "24 and 1" do
    assert_output(["24", "1"], "Each person gets 0 pieces of pizza.\nThere are 8.0 leftover pieces.")
  end

  test "100 and 20" do
    assert_output(["100", "20"], "Each person gets 1 piece of pizza.\nThere are 60.0 leftover pieces.")
  end

  test "7 and 1" do
    assert_output(["7", "1"], "Each person gets 1 piece of pizza.\nThere is 1.0 leftover piece.")
  end

  defp assert_output(list_of_strings, output) do
    assert String.contains?(captured(Enum.join(list_of_strings, "\n")), output)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &PizzaParty.C.go/0) |> String.strip
  end

end
