defmodule PaintCalculator.D do
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
      { amount, _ } -> amount |> round
    end
  end

  def put(room_sq_ft) do
    gallons_needed = room_sq_ft / @gallon_to_sq_ft |> Float.ceil
    IO.puts "You will need to purchase #{gallons_needed |> trunc} gallons of paint to cover #{room_sq_ft} square feet."
  end

  def rectangle do
    length = retrieve("Enter the length: ")
    width = retrieve("Enter the width: ")
    room_sq_ft = length * width
    put(room_sq_ft)
  end

  def circle do
    radius = retrieve("Enter the radius of the circle: ")
    room_sq_ft = 3.14159265359 * (radius * radius)
    put(room_sq_ft)
  end

  def l_shape do
    outer_length = retrieve("Enter the outer length of the L shaped room: ")
    outer_width = retrieve("Enter the outer width of the L shaped room: ")
    inner_length = retrieve("Enter the inner length of the L shaped room: ")
    inner_width = retrieve("Enter the inner width of the L shaped room: ")
    room_sq_ft = outer_length * outer_width - (inner_length * inner_width)
    put(room_sq_ft)
  end

  def go do
    shape = IO.gets("r/c/l? ") |> String.strip
    case shape do
      "r" -> rectangle
      "c" -> circle
      "l" -> l_shape
      _ ->
        IO.puts "Enter either r, c or l. Try again."
        go
    end
  end


end
