defmodule PaintCalculator.A.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "must be a number" do
    assert_output(["abcm", "bobm", "10", "8"], "Please enter a valid amount.")
  end

  test "negative numbers" do
    assert_output(["-8", "-15", "10", "8"], "No negatives allowed.")
  end

  test "10 and 4" do
    assert_output(["10", "4"], "You will need to purchase 1.0 gallons of paint to cover 40 square feet.")
  end

  test "10 and 40" do
    assert_output(["10", "40"], "You will need to purchase 2.0 gallons of paint to cover 400 square feet.")
  end

  test "500 and 500" do
    assert_output(["500", "500"], "You will need to purchase 715.0 gallons of paint to cover 250000 square feet.")
  end

  test "10.5 and 123.2" do
    assert_output(["10.5", "123.2"], "You will need to purchase 4.0 gallons of paint to cover 1353 square feet.")
  end

  defp assert_output(list_of_strings, output) do
    assert String.contains?(captured(Enum.join(list_of_strings, "\n")), output)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &PaintCalculator.A.go/0) |> String.strip
  end

end
