defmodule CurrencyConversion.A do

  import InputRetriever

  def go do
    euros = retrieve("How many euros are you exchanging? ")
    exchange_rate = retrieve("What is the exchange rate? ")

    IO.puts """
    #{euros} euros at an exchange rate of #{exchange_rate} is
    #{(euros * exchange_rate) |> Float.ceil(2)} U.S dollars
    """
  end

end
