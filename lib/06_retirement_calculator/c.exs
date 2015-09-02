current_age = IO.gets("What is your current age? ") |> String.strip |> String.to_integer
retirement_age = IO.gets("At what age would you like to retire? ") |> String.strip |> String.to_integer
year = :erlang.date |> Tuple.to_list |> List.first
if retirement_age < current_age do
  IO.puts "It's #{year} so you could have retired in #{year + retirement_age - current_age}. That was #{current_age - retirement_age} years ago."
else
  IO.puts "It's #{year} so you can retire in #{year + retirement_age - current_age}. That is in #{retirement_age - current_age} years."
end
