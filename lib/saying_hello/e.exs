defmodule SayingHello do
  def input do
    IO.gets("What is you name? ") |> String.strip
  end

  def thing("Gavin") do
    IO.puts "Hello, Gavin, you are totaly awesome!"
  end

  def thing("Luke") do
    IO.puts "Hello, Luke, you are not awesome!"
  end

  def thing(name) do
    IO.puts "Hello, #{name}, nice to meet you!"
  end

  def go do
    thing(input)
  end
end
SayingHello.go
