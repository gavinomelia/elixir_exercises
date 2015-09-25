defmodule PaintCalculator.B do
  @gallon_to_sq_ft 350

  import InputRetriever

  def go do
    radius = retrieve("Enter the radius of the circle: ") |> round
    room_sq_ft = 3.14159265359 * (radius * radius)
    gallons_needed = room_sq_ft / @gallon_to_sq_ft |> Float.ceil
    IO.puts "You will need to purchase #{gallons_needed |> trunc} gallons of paint to cover #{room_sq_ft |> Float.round(3)} square feet."
  end
end
