defmodule TemperatureConverter.C do
  import InputRetriever
  def go do
    from_unit = retrieve_string("Enter C for Celcius or F for Fahrenheit: ") |> String.upcase
    output(from_unit)
  end
  
  def output("F") do
    temp_f = retrieve("Enter the temp in Fahrenheit: ")
    celcius_temp = (temp_f - 32) * (5/9) |> Float.round(2)
    IO.puts "The temp in celcius is #{celcius_temp}"
  end

  def output("C") do
    temp_c = retrieve("Enter the temp in Celcuis: ")
    fahrenheit_temp = (temp_c * (9/5)) + 32 |> Float.round(2)
    IO.puts "The temp in fahrenheit is #{fahrenheit_temp}"
  end

  def output(_) do
   IO.puts "That is not a valid temperature unit. Please try again."
   go
 end
end
