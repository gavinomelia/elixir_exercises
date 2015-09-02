defmodule SayingHello.G.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    assert_response("Gavin", "Hello, Gavin, you are totaly awesome!")
    assert_response("Luke", "Hello, Luke, you are not awesome!")
    assert_response("Joe", "Hello, Joe, nice to meet you!")
  end

  defp assert_response(input, expected_output) do
    captured = capture_io([input: input, capture_prompt: false], &SayingHello.G.go/0) |> String.strip
    assert captured == expected_output
  end

end
