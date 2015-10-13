defmodule TaxCalculator.A do
  import InputRetriever
  import MoneyFormatter

  def go do
    amount = retrieve("What is the order amount? ")
    state = IO.gets("What is the state? ") |> String.strip
    tax_rate = 55 / 1000
    tax = tax_rate * amount
    total = amount + tax

    if state == "WI" do
      IO.puts """
      The subtotal is: $#{amount |> format}.
      The tax is: #{tax}.
      The total is #{total}.
      """
    end

    if state !== "WI" do
      IO.puts "The total is $#{amount |> format}"
    end
  end
end
