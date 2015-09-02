first = IO.gets("What is the first number? ") |> String.strip |> String.to_integer
second = IO.gets("What is the second number? ") |> String.strip |> String.to_integer
added = first + second
subtracted = first - second
multiplied = first * second
divided = first / second


IO.puts "#{first} + #{second} = #{added} \n #{first} - #{second} = #{subtracted} \n #{first} * #{second} = #{multiplied} \n #{first} / #{second} = #{divided}"
