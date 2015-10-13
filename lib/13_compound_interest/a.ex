defmodule CompoundInterest.A do
  import InputRetriever
  def calculate_interest(principal, interest, years, compound) do
    :math.pow((1 + (interest / 100) / compound), compound * years) * principal |>  Float.ceil(2)
  end

  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    compound = retrieve("How many times is the interest compounded per year? ")

    IO.puts "$#{principal |> Float.to_string [decimals: 2]} invested at #{interest}% for #{years} years compounded #{compound} times per year is $#{calculate_interest(principal, interest, years, compound)}"
  end
end
