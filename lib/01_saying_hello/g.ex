defmodule SayingHello.G do
  defp input do
    IO.gets("What is your name? ") |> String.strip
  end

  defp response("Gavin"), do: "Hello, Gavin, you are totaly awesome!"
  defp response("Luke"), do: "Hello, Luke, you are not awesome!"
  defp response(name), do: "Hello, #{name}, nice to meet you!"

  def go do
   IO.puts(input |> response)
  end
end
