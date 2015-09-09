defmodule PizzaParty.D do

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
    pieces_per_person = retrieve("How many pieces does each person want? ")
    pizzas_needed = pieces_per_person * people / 8 |> Float.ceil |> trunc
    IO.puts "You need to buy #{pizzas_needed} pizzas."
  end
end
