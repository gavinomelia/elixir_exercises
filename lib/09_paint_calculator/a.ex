defmodule PaintCalculator.A do
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
    length = retrieve("Enter the length ") |> round
    width = retrieve("Enter the width ") |> round
    room_sq_ft = length * width
    gallons_needed = room_sq_ft / @gallon_to_sq_ft |> Float.ceil
    IO.puts """
    You will need to purchase #{gallons_needed} gallons of paint to cover #{room_sq_ft} square feet.
    """
  end
end
