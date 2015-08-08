defmodule SayingHello do
  def input do
    IO.gets("What is you name? ") |> String.strip
  end

  def go do
    name = input
    case name do
      "Gavin" -> IO.puts "Hello, Gavin, you are totaly awesome!"
      "Luke" -> IO.puts "Hello, Luke, you are not awesome!"
      _ -> IO.puts "Hello, #{name}, nice to meet you!"
    end
  end
end
SayingHello.go
