defmodule AreaOfARoom.D do
  @to_sqmeters_formula 0.09290304
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

  def to_feet(dimension, measurement) do
    if measurement == "m" do
      dimension * @to_feet_formula
    else
      dimension
    end
  end

  def go do
    { length, measurement } = retrieve("length")
    feet_length = to_feet(length, measurement)
    { width, measurement } = retrieve("width")
    feet_width = to_feet(width, measurement)
    feet_area = feet_length * feet_width
    meter_area = feet_area * @to_sqmeters_formula
    IO.puts """
    You entered dimensions of #{length}#{measurement} by #{width}#{measurement}
    The area of the room is #{feet_area |> Float.to_string [decimals: 3, compact: true]} square feet.
    #{meter_area |> Float.to_string [decimals: 3, compact: true]} square meters
    """
  end
end
