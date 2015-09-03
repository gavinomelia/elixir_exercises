defmodule AreaOfARoom.C do
  @to_sqmeters_formula 0.09290304
  @to_sqfeet_formula 10.7639
  @to_feet_formula 3.28084

  def retrieve(dimension) do
    number = IO.gets("What is the #{dimension} of the room? ") |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "Please enter a valid amount."
        retrieve(dimension)
      { amount, _ } when amount < 0 ->
        IO.puts "No negatives allowed."
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

  def go do
    { length, measurement } = retrieve("length")
    first_measurement = measurement
    { width, measurement } = retrieve("width")
    second_measurement = measurement
    area = length * width
    string_area = area |> Float.to_string [decimals: 3, compact: true]

    case [first_measurement, second_measurement] do
      ["ft", "ft"] ->
        area_meters = area * @to_sqmeters_formula |> Float.to_string [decimals: 3, compact: true]
        IO.puts "You entered dimensions of #{length} feet by #{width} feet."
        IO.puts "The area of the room is #{string_area} square feet."
        IO.puts "#{area_meters} square meters"
      ["m", "m"] ->
        area_feet = area * @to_sqfeet_formula |> Float.to_string [decimals: 3, compact: true]
        IO.puts "You entered dimensions of #{length} meters by #{width} meters."
        IO.puts "The area of the room is #{string_area} square meters."
        IO.puts "#{area_feet} square feet"
      ["ft", "m"] ->
        feet_width = width * @to_feet_formula
        first_area = length * feet_width
        meter_area = first_area * @to_sqmeters_formula
        first_string_area = first_area |> Float.to_string [decimals: 3, compact: true]
        IO.puts "You entered dimensions of #{length} feet by #{width} meters."
        IO.puts "The area of the room is #{first_string_area} square feet."
        IO.puts "#{meter_area |> Float.to_string [decimals: 3, compact: true]} square meters"
      ["m", "ft"] ->
        feet_length = length * @to_feet_formula
        second_area = width * feet_length
        meter_area = second_area * @to_sqmeters_formula
        second_string_area = second_area |> Float.to_string [decimals: 3, compact: true]
        IO.puts "You entered dimensions of #{length} meters by #{width} feet."
        IO.puts "The area of the room is #{second_string_area} square feet."
        IO.puts "#{meter_area} square meters"
    end
  end
end
