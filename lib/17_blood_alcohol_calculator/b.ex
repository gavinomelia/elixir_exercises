defmodule BloodAlcoholCalculator.B do
  import InputRetriever

  def go do
    weight = retrieve("What is your weight? ")
    gender = retrieve_string("What is your gender? ", true)
    if gender == "M", do: distribution = 0.73, else: distribution = 0.66
    ounces = retrieve("How many ounces of alcohol did you consume? ")
    time_passed = retrieve("How many hours was it since your last drink? ")
    bac = ((ounces * 5.14) / (weight * distribution)) - (0.015 * time_passed) |> Float.round(3)
    if bac >= 0.08 do
      IO.puts "Since your BAC is #{bac}, it is NOT legal for you to drive."
    else
      IO.puts "Since your BAC is #{bac}, it is legal for you to drive."
    end
  end
end
