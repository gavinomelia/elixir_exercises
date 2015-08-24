defmodule SimpleMath do
  def input(num) do
    get = IO.gets("What is the #{num} number? ") |> String.strip |> Float.parse
    IO.inspect get
    if get == :error do
      get
    else
      { amount, _ } = get
      amount
    end
  end

  def retrieve(prompt) do
    number = input(prompt)
    cond do
      number == :error ->
        IO.puts "You did not enter a valid number"
        retrieve(prompt)
      number < 0 ->
        IO.puts "Negative numbers are not allowed. Try again."
        retrieve(prompt)
      true ->
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
