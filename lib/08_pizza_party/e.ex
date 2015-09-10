defmodule PizzaParty.E do

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

  defp plural(1), do: "piece"
  defp plural(_), do: "pieces"
  defp is_are(1), do: "is"
  defp is_are(_), do: "are"

  def go do
    people = retrieve("How many people? ") |> round
    pizzas = retrieve("How many pizzas do you have? ")
    total_slices = pizzas * 8
    pizza_per_person = (total_slices) / people |> trunc
    leftover_pieces = total_slices - (pizza_per_person * people)
     IO.puts """
    #{people} people with #{pizzas} #{plural(pizzas)}
    Each person gets #{pizza_per_person} #{plural(pizza_per_person)} of pizza.
    There #{is_are(leftover_pieces |> trunc)} #{leftover_pieces} leftover #{plural(leftover_pieces |> trunc)}.
    """
  end
end
