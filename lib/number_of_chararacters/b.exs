input = IO.gets("What is the input string? ") |> String.strip
if input |> String.length == 0 do
  IO.puts "You didn't enter any characters."
else
  IO.puts "The number of characters in #{input} is #{input |> String.length}"
end
