defmodule TaxCalculator.D do
  import InputRetriever
  import MoneyFormatter

  def output(state, amount) when state in ["WI", "WISCONSIN"] do
    tax = 55 / 1000 * amount
    total = amount + tax
    IO.puts """
    The subtotal is: $#{amount |> format}.
    The tax is: $#{tax |> format}.
    The total is $#{total |> format}.
    """
  end

  def output(_, amount) do
    IO.puts "The total is $#{amount |> format}"
  end

  def go do
    amount = retrieve("What is the order amount? ")
    state = IO.gets("What is the state? ") |> String.strip |> String.upcase
    output(state, amount)
  end
end
