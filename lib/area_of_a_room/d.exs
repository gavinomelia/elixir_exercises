defmodule AreaOfARoom do
  @to_meters_formula 0.09290304
  @to_feet_formula 3.28084

  def retrieve(dimension) do
    number = IO.gets("What is the #{dimension} of the rectangle? ") |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "You did not enter a valid number"
        retrieve(dimension)
      { amount, _ } when amount < 0 ->
        IO.puts "Negative numbers are not allowed. Try again."
        retrieve(dimension)
      { amount, measurement } ->
        case measurement do
      "ft" ->
        { amount, measurement }
      "m" ->
        { amount, measurement }
      _ ->
        IO.puts "You must enter either ft or m at the end of your number. Try again."
        retrieve(dimension)
    end
  end
end

def feet_and_meters(first, second) do
  feet_dimension = first * @to_feet_formula
  first_area = second * feet_dimension
  meter_area = first_area * @to_meters_formula
  first_string_area = first_area |> Float.to_string [decimals: 3, compact: true]
  IO.puts "You entered dimensions of #{second} feet by #{first} meters."
  IO.puts "The area of the room is #{first_string_area} square feet."
  IO.puts "#{meter_area} square meters"
end

def go do
  { length, measurement } = retrieve("length")
  first_measurement = measurement
  { width, measurement } = retrieve("width")
  second_measurement = measurement
  area = length * width
  string_area = area |> Float.to_string [decimals: 3, compact: true]
  if first_measurement == "ft" do
    first = "feet"
  else
    first = "meters"
  end
  if second_measurement == "ft" do
    second = "feet"
  else
    second = "meters"
  end

  case [first, second] do
    ["feet", "feet"] ->
      area_meters = area * @to_meters_formula |> Float.to_string [decimals: 3, compact: true]
      IO.puts "You entered dimensions of #{length} feet by #{width} feet."
      IO.puts "The area of the room is #{string_area} square feet."
      IO.puts "#{area_meters} square meters"
    ["meters", "meters"] ->
      area_feet = area * @to_feet_formula |> Float.to_string [decimals: 3, compact: true]
      IO.puts "You entered dimensions of #{length} meters by #{width} meters."
      IO.puts "The area of the room is #{string_area} square meters."
      IO.puts "#{area_feet} square feet"
    ["feet", "meters"] ->
      feet_and_meters(width, length)
    ["meters", "feet"] ->
      feet_and_meters(length, width)
  end
end
end
AreaOfARoom.go
