defmodule TemperatureConverter.D do
  import InputRetriever

  def from_to_converter("F") do
    { "Fahrenheit", "Celcius", fn(temp) -> (temp - 32) * (5/9) end }
  end

  def from_to_converter("C") do
    { "Celcius", "Fahrenheit", fn(temp) -> (temp * (9/5)) + 32 end }
  end

  def go do
    IO.puts "Would you like to convert from C (eslcius) or F (ahrenheit)"
    convert_from = retrieve_string("Your choice: ", ~w[C c F f])
    { from, to, converter } = from_to_converter(convert_from)
    temp = retrieve("Please enter the temperature in #{from}: ")
    IO.puts "The temperature in #{to} is #{converter.(temp) |> Float.round(2)} degrees."
  end

end