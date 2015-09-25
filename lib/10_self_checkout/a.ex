defmodule SelfCheckout.A do

  import InputRetriever

  def price(num) do
    retrieve("Enter the price of item #{num}: ")
  end

  def quantity(num) do
    retrieve("Enter the quantity of item #{num}: ")
  end

  def go do
    price_1 = price("1")
    quantity_1 = quantity("1")
    price_2 = price("2")
    quantity_2 = quantity("2")
    price_3 = price("3")
    quantity_3 = quantity("3")

    subtotal = (price_1 * quantity_1) + (price_2 * quantity_2) + (price_3 * quantity_3)
    tax = subtotal * 0.055
    total = subtotal + tax

    IO.puts """
    Subtotal: $#{subtotal}
    Tax: $#{tax}
    Total: $#{total}
    """
  end
end
