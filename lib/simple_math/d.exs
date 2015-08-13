defmodule SimpleMath do
  def retreive_amount(number) do
    {number, _} = IO.gets("What is the #{number} number? ") |> String.strip |> Float.parse
  end

  def go do
    added = retreive_amount("first") + second
    subtracted = first - second
    multiplied = first * second
    divided = first / second

    cond do
      first < 0 ->
        IO.puts "Sorry negitive numbers are not allowed"
      second < 0 ->
        IO.puts "Sorry negitive numbers are not allowed"
      true ->
        IO.puts """
        #{retreive_amount("first")} + #{retreive_amount("second")} = #{added}
        #{retreive_amount("first")} - #{retreive_amount("second")} = #{subtracted}
        #{retreive_amount("first")} * #{retreive_amount("second")} = #{multiplied}
        #{retreive_amount("first")} / #{retreive_amount("second")} = #{divided}
        """

    end
  end
end
SimpleMath.go
