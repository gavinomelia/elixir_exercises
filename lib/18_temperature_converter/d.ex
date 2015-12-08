defmodule TemperatureConverter.D do
  import InputRetriever
  def go do
    from_unit = IO.gets("Enter C for Celcius or F for Fahrenheit: ") |> String.strip |> String.upcase
    output(from_unit)
  end

  def output("C") do
    temp = retrieve("Enter the temp in Celcius: ")
    new_temp = calculate(temp, "C")
    IO.puts "The temp in Fahrenheit is #{new_temp}"
  end

  def output("F") do
    temp = retrieve("Enter the temp in Fahrenheit: ")
    new_temp = calculate(temp, "F")
    IO.puts "The temp in Celcius is #{new_temp}"
  end

  def output(_) do
    IO.puts "That is not a valid temperature unit. Please try again."
    go
  end

  def calculate(temp, "F"), do: (temp - 32) * (5/9) |> Float.round(2)
  def calculate(temp, "C"), do: (temp * (9/5)) + 32 |> Float.round(2)
end