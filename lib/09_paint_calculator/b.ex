defmodule PaintCalculator.B do
  @gallon_to_sq_ft 350

  def retrieve(prompt) do
    number = IO.gets(prompt) |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "Please enter a valid amount."
        retrieve(prompt)
      { amount, _ } when amount < 0 ->
        IO.puts "No negatives allowed."
        retrieve(prompt)
      { amount, _ } -> amount
    end
  end

  def go do
    radius = retrieve("Enter the radius of the circle ") |> round
    room_sq_ft = 3.14159265359 * (radius * radius)
    gallons_needed = room_sq_ft / @gallon_to_sq_ft |> Float.ceil
    IO.puts """
    You will need to purchase #{gallons_needed} gallons of paint to cover #{room_sq_ft |> Float.round(3)} square feet.
    """
  end
end
