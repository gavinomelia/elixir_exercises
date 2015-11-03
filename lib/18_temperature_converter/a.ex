defmodule TemperatureConverter.A do
  import InputRetriever
  def go do
    temp_unit = IO.gets("Enter C for Celcius or F for Fahrenheit: ") |> String.strip |> String.upcase
    case temp_unit do
      "F" ->
        temp_f = retrieve("Enter the temp in Fahrenheit: ")
        celcius_temp = (temp_f - 32) * (5/9) |> Float.round(2)
        IO.puts "The temp in celcius is #{celcius_temp}"
      "C" ->
        temp_c = retrieve("Enter the temp in Celcuis: ")
        fahrenheit_temp = (temp_c * (9/5)) + 32 |> Float.round(2)
        IO.puts "The temp in fahrenheit is #{fahrenheit_temp}"
      _ ->
        IO.puts "That is not a valid temperature unit. Please try again."
        go
    end
  end
end
