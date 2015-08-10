defmodule NumberOfCharacters do
  def input do
    IO.gets("What is the input string? ") |> String.strip
  end

  def go do
    gets = input
    if String.length(gets) == 0 do
      IO.puts "You didn't enter any characters."
      go
    else
      IO.puts "The number of characters in #{gets} is #{gets |> String.length}"
    end
  end
end
NumberOfCharacters.go
