defmodule SelfCheckout.B do

  def retrieve(prompt) do
    number = IO.gets(prompt) |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "Please enter a valid amount."
        retrieve(prompt)
      { amount, _ } when amount < 0 ->
        IO.puts "No negatives allowed."
        retrieve(prompt)
      { amount, _ } -> amount
    end
  end

  def price_quantity do
    price = retrieve("Enter the price of the item: ")
    quantity = retrieve("Enter the quantity of the item: ")
    {price, quantity}
  end

  defp retrieve_line_items(acc \\ []) do
    the_num = price_quantity
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
