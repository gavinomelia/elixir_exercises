defmodule PaintCalculator.C do
  @gallon_to_sq_ft 350

  import InputRetriever

  def go do
    outer_length = retrieve("Enter the outer length of the L shaped room: ") |> round
    outer_width = retrieve("Enter the outer width of the L shaped room: ") |> round
    inner_length = retrieve("Enter the inner length of the L shaped room: ") |> round
    inner_width = retrieve("Enter the inner width of the L shaped room: ") |> round
    room_sq_ft = outer_length * outer_width - (inner_length * inner_width)
    gallons_needed = room_sq_ft / @gallon_to_sq_ft |> Float.ceil
    IO.puts "You will need to purchase #{gallons_needed |> trunc} gallons of paint to cover #{room_sq_ft} square feet."
  end
end
