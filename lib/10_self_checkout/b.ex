  defmodule SelfCheckout.B do

  import InputRetriever

  def price_quantity do
    price = retrieve("Enter the price of the item: ")
    quantity = retrieve("Enter the quantity of the item: ")
    {price, quantity}
  end

  defp retrieve_line_items(acc \\ []) do
    the_num = price_quantity
    IO.inspect the_num
    if the_num == {0, 0} do
      acc |> Enum.reverse
    else
      retrieve_line_items([ the_num | acc ])
    end
  end

  def compact(number) do
    number |> Float.to_string [decimals: 2]
  end

  def go do
    subtotal = Enum.reduce(retrieve_line_items, 0, fn({ price, quantity }, acc) -> (price * quantity) + acc end)
    tax = subtotal * 0.055
    total = subtotal + tax

    IO.puts """
    Subtotal: $#{subtotal |> compact}
    Tax: $#{tax |> compact}
    Total: $#{total |> compact}
    """
  end
end
