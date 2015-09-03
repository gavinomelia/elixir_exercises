defmodule AreaOfARoom.C.Test do
 use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "feet by feet" do
    result = captured("10ft\n10ft")
    assert String.contains?(result, "The area of the room is 100.0 square feet.\n9.29 square meters")
  end

  test "meters by meters" do
    result = captured("10m\n10m")
    assert String.contains?(result, "The area of the room is 100.0 square meters.\n1076.39 square feet")
  end

  test "meters by feet" do
    result = captured("10m\n123ft")
    assert String.contains?(result, "The area of the room is 4035.433 square feet.\n374.90401199692803 square meters")
  end

  test "feet by meters" do
    result = captured("123.123ft\n555m")
    assert String.contains?(result, "The area of the room is 224190.509 square feet.\n20827.98 square meters")
  end

  test "must be a number" do
    result = captured("abcm\nbobm\n10m\n8m")
    assert String.contains?(result, "Please enter a valid amount.")
  end

  test "negative numbers" do
    result = captured("-8\n-15\n10m\n8m")
    assert String.contains?(result, "No negatives allowed.")
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &AreaOfARoom.C.go/0) |> String.strip
  end

end
