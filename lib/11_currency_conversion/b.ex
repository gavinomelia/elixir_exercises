defmodule CurrencyConversion.B do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def go do
    euros = retrieve("How many euros are you exchanging? ")
    exchange_rate = retrieve("What is the exchange rate? ")

    IO.puts """
    #{euros |> compact} euros at an exchange rate of #{exchange_rate} is
    #{euros * exchange_rate |> compact} U.S dollars
    """
  end

end
