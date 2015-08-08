defmodule TipCalculator do
  def input do
    bill_amount = IO.gets "What is the total? "
    tip_rate = IO.gets "What is the tip rate? "
    tip_fraction = String.to_integer(String.strip(tip_rate)) / 100
    # IO.puts "tip_fraction = #{tip_fraction}"
    tip = String.to_integer(String.strip(bill_amount)) * tip_fraction
    IO.puts "Tip: $#{tip}"
    IO.puts "Total: $#{tip + String.to_integer(String.strip(bill_amount))}"
  end
end
TipCalculator.input
