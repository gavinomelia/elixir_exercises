defmodule TemperatureConverter.B do
  import InputRetriever
  def go do
    temp_unit = IO.gets("Enter C for Celcius or F for Fahrenheit: ") |> String.strip |> String.upcase
    case temp_unit do
      "F" -> output("Fahrenheit")
      "C" -> output("Celcius")
      _ ->
        IO.puts "That is not a valid temperature unit. Please try again."
        go
    end
  end

  def output(unit) do
    IO.inspect calculate(21, unit)
    temp = retrieve("Enter the temp in #{unit}: ")
    new_temp = calculate(temp, unit)

    if unit == "Fahrenheit" do
      new_unit = "Celcius"
    else
      new_unit = "Fahrenheit"
    end

    IO.puts "The temp in #{new_unit} is #{new_temp}"
  end

  def calculate(temp, "Fahrenheit"), do: (temp - 32) * (5/9) |> Float.round(2)
  def calculate(temp, "Celcius"), do: (temp * (9/5)) + 32 |> Float.round(2)
end
