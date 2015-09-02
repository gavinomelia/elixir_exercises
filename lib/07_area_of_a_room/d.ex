defmodule AreaOfARoom.D do
  @to_meters_formula 0.09290304
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

  def feet_and_meters(first, second) do
    feet = first * @to_feet_formula
    first_area = second * feet
    string_area = first_area |> Float.to_string [decimals: 3, compact: true]
    meter_area = first_area * @to_meters_formula
    IO.puts "You entered dimensions of #{second} feet by #{first} meters."
    IO.puts "The area of the room is #{string_area} square feet."
    IO.puts "#{meter_area} square meters"
  end

  def feet_or_meters(length, width, string_area, area, measurement) do
    if measurement == "m" do
      formula = @to_feet_formula
    else
      formula = @to_meters_formula
    end
    area_measuremet = area * formula |> Float.to_string [decimals: 3, compact: true]
    IO.puts "You entered dimensions of #{length} feet by #{width} feet."
    IO.puts "The area of the room is #{string_area} square meters."
    IO.puts "#{area_measuremet} square feet"
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
        feet_or_meters(length, width, string_area, area, "ft")
      ["m", "m"] ->
        feet_or_meters(length, width, string_area, area, "m")
      ["ft", "m"] ->
        feet_and_meters(width, length)
      ["m", "ft"] ->
        feet_and_meters(length, width)
    end
  end
end
