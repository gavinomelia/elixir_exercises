defmodule PizzaParty.A do

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
    leftover_pieces = total_slices - (pizza_per_person * people)
    IO.puts """
    #{people} people with #{pizzas} pizzas
    Each person gets #{pizza_per_person} pieces of pizza.
    There are #{leftover_pieces} leftover pieces.
    """
  end
end
