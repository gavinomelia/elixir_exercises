defmodule BMICalculator.B do
  import InputRetriever
  def go do
    units = "Would you like to use Metric or Imperial units? "
    weight = retrieve("What is your weight? ")
    height = retrieve("What is your height? ")
    bmi = (weight / (height * height)) * 703
    IO.puts "Your BMI is #{bmi}"
    min .. max = 18.5..25.0
    if Enum.member?(18.5..25.0, bmi) do
      IO.puts "You are within the ideal weight range."
    else
    if bmi < min do
      IO.puts "You are underweight. You should see your doctor."
    else
      IO.puts "You are overweight. You should see your doctor."
    end
    end
  end
end
