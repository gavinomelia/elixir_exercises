defmodule SimpleMath do

  def retrieve(prompt) do
    number = IO.gets("What is the #{prompt} number? ") |> String.strip
    case number |> Float.parse  do
      :error ->
        IO.puts "You did not enter a valid number"
        retrieve(prompt)
      { amount, _ } when amount < 0 ->
        IO.puts "Negative numbers are not allowed. Try again."
        retrieve(prompt)
      { amount, _ } -> amount
   end
  end

  def go do
    first = retrieve("first")
    second = retrieve("second")

    IO.puts """
    #{first} + #{second} = #{first+second}
    #{first} - #{second} = #{first-second}
    #{first} * #{second} = #{first*second}
    #{first} / #{second} = #{first/second}
    """
  end
end

SimpleMath.go
