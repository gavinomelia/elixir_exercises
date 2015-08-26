defmodule AreaOfARoom do
  @formula 0.09290304

    def retrieve(dimension) do
    number = IO.gets("What is the #{dimension} of the rectangle? ") |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "You did not enter a valid number"
        retrieve(dimension)
      { amount, _ } when amount < 0 ->
        IO.puts "Negative numbers are not allowed. Try again."
        retrieve(dimension)
      { amount, _ } -> amount
    end
  end

  def go do
    length = retrieve("length")
    width = retrieve("width")
    area = (length * width)
    string_area = area |> Float.to_string [decimals: 3, compact: true]
    area_meters = area * @formula |> Float.to_string [decimals: 3, compact: true]
    IO.puts "You entered dimensions of #{length} feet by #{width} feet."
    IO.puts "The area of the room is #{string_area} square feet."
    IO.puts "#{area_meters} square meters"
  end
end
AreaOfARoom.go
