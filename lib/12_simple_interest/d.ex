defmodule SimpleInterest.D do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def calculate_simple_interest(principal, interest, year) do
    (1 + ((interest / 100) * year)) * principal
  end

  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ") |> trunc
    Enum.reduce(1..years, 0, fn(year, acc) -> (
      IO.puts "\nAfter #{year} year/s at #{interest}%, the investment will be worth $#{calculate_simple_interest(principal, interest, year) |> compact}.")
    end)
  end
end
