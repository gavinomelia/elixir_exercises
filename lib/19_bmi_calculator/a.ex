defmodule BMICalculator.A do
  import InputRetriever
  def go do
    weight = retrieve("What is your weight? ")
    height = retrieve("What is your height in inches? ")
    bmi = (weight / (height * height)) * 703
    IO.puts "Your BMI is #{bmi}"
    #   IO.puts "You are within the ideal weight range."
    # else
    #   IO.puts "You should see a doctor!"
    # end
  end
end

