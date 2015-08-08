    {bill_amount, _} = IO.gets("What is the total? ") |> String.strip |> Float.parse
    {tip_percentage, _} = IO.gets("What is the tip percentage? ") |> String.strip |> Float.parse
    tip_decimal = tip_percentage / 100
    tip = bill_amount * tip_decimal
    IO.puts "Tip: $#{tip}"
    IO.puts "Total: $#{tip + bill_amount}"
