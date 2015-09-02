{first, _} = IO.gets("What is the first number? ") |> String.strip |> Float.parse
{second, _} = IO.gets("What is the second number? ") |> String.strip |> Float.parse
added = first + second
subtracted = first - second
multiplied = first * second
divided = first / second


IO.puts "#{first} + #{second} = #{added} \n #{first} - #{second} = #{subtracted} \n #{first} * #{second} = #{multiplied} \n #{first} / #{second} = #{divided}"
