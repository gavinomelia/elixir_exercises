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
      { amount, measurement } -> { amount, measurement }
    end
  end


  def go do
    { length, measurement } = retrieve("length")
    
    { width, measurement } = retrieve("width")
    IO.inspect length
    if measurement == "ft" do
      IO.puts "It's feet"
      area = length * width
      string_area = area |> Float.to_string [decimals: 3, compact: true]
      area_meters = area * @to_meters_formula |> Float.to_string [decimals: 3, compact: true]
      IO.puts "You entered dimensions of #{length} feet by #{width} feet."
      IO.puts "The area of the room is #{string_area} square feet."
      IO.puts "#{area_meters} square meters"
    end
    # IO.inspect measurement
    IO.inspect width
    if measurement == "m" do
      IO.puts "It's meters"
      area = length * width
      string_area = area |> Float.to_string [decimals: 3, compact: true]
      area_feet = area * @to_feet_formula |> Float.to_string [decimals: 3, compact: true]
      IO.puts "You entered dimensions of #{length} meters by #{width} meters."
      IO.puts "The area of the room is #{string_area} square meters."
      IO.puts "#{area_feet} square feet"
    end
  end
end
# AreaOfARoom.length
# AreaOfARoom.width
AreaOfARoom.go
