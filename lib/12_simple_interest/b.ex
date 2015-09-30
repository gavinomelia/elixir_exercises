defmodule SimpleInterest.B do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def calculate_simple_interest(principal, interest, years) do
    (1 + ((interest / 100) * years)) * principal
  end

  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")

    IO.puts "\nAfter #{years} years at #{interest}%, the investment will be worth $#{calculate_simple_interest(principal, interest, years) |> compact}."
  end

end
