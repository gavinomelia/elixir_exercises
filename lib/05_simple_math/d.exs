defmodule SimpleMath do
  def input(num) do
    { amount, _ } = IO.gets("What is the #{num} number? ") |> String.strip |> Float.parse
    amount
  end

  def retrieve(prompt) do
    number = input(prompt)
    if number < 0 do
      IO.puts "negitive numbers are not allowed"
      retrieve(prompt)
    else
      number
    end
  end

  def go do
    first = retrieve("first")
    second = retrieve("second")

    added = first + second
    subtracted = first - second
    multiplied = first * second
    divided = first / second

    IO.puts """
    #{first} + #{second} = #{added}
    #{first} - #{second} = #{subtracted}
    #{first} * #{second} = #{multiplied}
    #{first} / #{second} = #{divided}
    """
  end
end

SimpleMath.go
