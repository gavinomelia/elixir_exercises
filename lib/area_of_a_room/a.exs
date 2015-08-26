defmodule AreaOfARoom do
length = IO.gets("What is the length of the room in feet? ") |> String.strip |> String.to_integer
width = IO.gets("What is the width of the room in feet? ") |> String.strip |> String.to_integer
area = length * width
@formula 0.09290304
area_meters = area * @formula
IO.puts "You entered dimensions of #{length} feet by #{width} feet."
IO.puts "The area of the room is #{area} square feet."
IO.puts "#{area_meters} square meters"
end
