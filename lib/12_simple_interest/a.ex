defmodule SimpleInterest.A do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    total = (1 + ((interest / 100) * years)) * principal
    IO.puts "\nAfter #{years} years at #{interest}%, the investment will be worth $#{total |> compact}."
  end

end
