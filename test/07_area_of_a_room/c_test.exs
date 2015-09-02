defmodule AreaOfARoom.C.Test do
 use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "feet by feet" do
    result = captured("10ft\n10ft")
    assert String.contains?(result, "You entered dimensions of 10.0 feet by 10.0 feet.\nThe area of the room is 100.0 square feet.\n9.29 square meters")
  end

  test "meters by meters" do
    result = captured("10m\n10m")
    IO.inspect result
    assert String.contains?(result, "You entered dimensions of 10.0 meters by 10.0 meters.\nThe area of the room is 100.0 square meters.\n1076.39 square feet")
  end

#change String.match to String.contains

  test "must be a number" do
    result = captured("abcm\nbobm\n10m\n8m")
    IO.inspect result
    assert String.match?(result, ~r/Please enter a valid amount./)
  end

  test "negative numbers" do
    result = captured("-8\n-15\n10m\n8m")
    assert String.match?(result, ~r/No negatives allowed./)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &AreaOfARoom.C.go/0) |> String.strip
  end

end
