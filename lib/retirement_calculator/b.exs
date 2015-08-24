current_age = IO.gets("What is your current age? ") |> String.strip |> String.to_integer
retirement_age = IO.gets("At what age would you like to retire? ") |> String.strip |> String.to_integer
date = :erlang.date |> Tuple.to_list
year = date |> List.first
if retirement_age < current_age do
  IO.puts "It's #{year} so you could have retired in #{year + retirement_age - current_age}"
else
  IO.puts "It's #{year} so you can retire in #{year + retirement_age - current_age}"
end
