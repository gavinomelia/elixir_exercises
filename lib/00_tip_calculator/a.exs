    bill_amount = IO.gets("What is the total? ") |> String.strip |> String.to_integer
    tip_percentage = IO.gets("What is the tip percentage? ") |> String.strip |> String.to_integer
    tip_decimal = tip_percentage / 100
    tip = bill_amount * tip_decimal
    IO.puts "Tip: $#{tip}"
    IO.puts "Total: $#{tip + bill_amount}"
