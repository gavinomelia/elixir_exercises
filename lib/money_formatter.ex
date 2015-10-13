defmodule MoneyFormatter do
  def format(number) do
    number |> Float.ceil(2) |> Float.to_string [decimals: 2]
  end
end
