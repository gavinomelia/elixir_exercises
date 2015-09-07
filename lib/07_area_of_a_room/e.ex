defmodule AreaOfARoom.E do
  @to_sqmeters_formula 0.09290304
  @to_feet_formula 3.28084

  defp retrieve(dimension) do
    number = IO.gets("What is the #{dimension} of the room? ") |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "Please enter a valid amount."
        retrieve(dimension)
      { amount, _ } when amount < 0 ->
        IO.puts "No negatives allowed."
        retrieve(dimension)
      { amount, units } when units in ~w(ft m)  ->
        { amount, units }
      _ ->
        IO.puts "You must enter either ft or m at the end of your number. Try again."
        retrieve(dimension)
    end
  end

  defp to_feet(dimension, "m"), do: dimension * @to_feet_formula
  defp to_feet(dimension, _), do: dimension

  defp into_string(area) do
    area |> Float.to_string [decimals: 3, compact: true]
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
    The area of the room is #{feet_area |> into_string} square feet.
    #{meter_area |> into_string} square meters
    """
  end
end
