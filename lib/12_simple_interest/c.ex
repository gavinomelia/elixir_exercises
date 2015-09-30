defmodule SimpleInterest.C do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def calculate_simple_interest(principal, interest, years) do
    (1 + ((interest / 100) * years)) * principal
  end

  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
    IO.puts n
  end

  def print_multiple_times(msg, n) do
    IO.puts msg
    IO.puts n
    print_multiple_times(msg, n - 1)
  end

def go do
  principal = retrieve("Enter the principal: ")
  interest = retrieve("Enter the rate of interest: ")
  years = retrieve("Enter the number of years: ")

  print_multiple_times("\nAfter #{years} years at #{interest}%, the investment will be worth $#{calculate_simple_interest(principal, interest, years) |> compact}." , years)

  IO.puts "\nAfter #{years} years at #{interest}%, the investment will be worth $#{calculate_simple_interest(principal, interest, years) |> compact}."
end
end
