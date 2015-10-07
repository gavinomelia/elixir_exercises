defmodule SimpleInterest.D do

  import InputRetriever
  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ") |> trunc
    increase_per_year = (interest / 100) * principal
    { yearly_totals, _ } = Enum.map_reduce(1..years, principal, fn(year, acc) ->
      yearly_total = increase_per_year + acc
      {{year, yearly_total}, yearly_total}
    end)

    Enum.each(yearly_totals, fn({ year, year_total }) ->
      IO.puts "\nAfter #{year} year/s at #{interest}%, the investment will be worth $#{year_total |> compact}"
    end)
  end
end
