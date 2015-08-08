input = IO.gets("What is the input string? ") |> String.strip
IO.puts "The number of characters in #{input} is #{input |> String.length}"
