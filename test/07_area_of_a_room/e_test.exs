defmodule AreaOfARoom.E.Test do
 use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "feet by feet" do
    assert_area(["10ft", "10ft"], "The area of the room is 100.0 square feet.\n9.29 square meters")
  end

  test "meters by meters" do
    assert_area(["10m", "10m"], "The area of the room is 1076.391 square feet.\n100.0 square meters")
  end

  test "meters by feet" do
    assert_area(["10m", "123ft"], "The area of the room is 4035.433 square feet.\n374.904 square meters")
  end

  test "feet by meters" do
    assert_area(["123.123ft", "555m"], "The area of the room is 224190.509 square feet.\n20827.98 square meters")
  end

  test "must be a number" do
   assert_area(["abcm", "bobm", "10m", "8m"], "Please enter a valid amount.")
  end

  test "negative numbers" do
    assert_area(["-8m", "-15ft", "10m", "8m"], "No negatives allowed.")
  end

  defp assert_area(list_of_strings, output) do
     assert String.contains?(captured(Enum.join(list_of_strings, "\n")), output)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &AreaOfARoom.E.go/0) |> String.strip
  end

end
