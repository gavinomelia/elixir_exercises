defmodule CurrencyConversion.C do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def go do
    currency = IO.gets("What is the abbreviation of the currency you want to exchange? ") |> String.strip |> String.upcase
    euros = retrieve("How many #{currency} are you exchanging? ")
    case HTTPoison.get("https://openexchangerates.org/api/latest.json?app_id=0ce02c1806464a499c4705c8bf785be1") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parsed = body |> Poison.decode!
        rates = parsed["rates"]
        exchange_rate = rates[currency]
      {:error, %HTTPoison.Error{reason: reason} } ->
        IO.puts "There was an error getting the current exchange rate. Defaulting to 0.894876."
        exchange_rate = 0.894876
    end
    IO.puts """
    #{euros |> compact} #{currency} at an exchange rate of #{exchange_rate} is
    #{(euros * exchange_rate) |> Float.ceil(2)} U.S dollars
    """
  end

end
