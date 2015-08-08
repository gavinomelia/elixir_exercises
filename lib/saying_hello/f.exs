defmodule SayingHello do
  defp input do
    IO.gets("What is you name? ") |> String.strip
  end

  defp response("Gavin") do
    "Hello, Gavin, you are totaly awesome!"
  end

  defp response("Luke") do
    "Hello, Luke, you are not awesome!"
  end

  defp response(name) do
    "Hello, #{name}, nice to meet you!"
  end

  def go do
   IO.puts(input |> response)
  end
end
SayingHello.go
