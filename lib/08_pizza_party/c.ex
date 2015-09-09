defmodule PizzaParty.C do

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
    people = retrieve("How many people? ")
    pizzas = retrieve("How many pizzas do you have? ")
    total_slices = pizzas * 8
    pizza_per_person = (total_slices) / people |> trunc
    if pizza_per_person == 1 do
      piece_1 = "piece"
    else
      piece_1 = "pieces"
    end
    leftover_pieces = total_slices - (pizza_per_person * people)
    if leftover_pieces == 1 do
      piece_2 = "piece"
      is_are = "is"
    else
      piece_2 = "pieces"
      is_are = "are"
    end
    IO.puts """
    #{people} people with #{pizzas} pizzas
    Each person gets #{pizza_per_person} #{piece_1} of pizza.
    There #{is_are} #{leftover_pieces} leftover #{piece_2}.
    """
  end
end
