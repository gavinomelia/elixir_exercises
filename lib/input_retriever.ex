defmodule InputRetriever do
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

      def retrieve_with_unit(prompt) do
        number = IO.gets(prompt) |> String.strip
        case number |> Float.parse  do
          :error ->
            IO.puts "Please enter a valid amount."
            retrieve(prompt)
            { amount, _ } when amount < 0 ->
              IO.puts "No negatives allowed."
              retrieve(prompt)
              { amount, unit } -> { amount, unit }
            end
          end

          def retrieve_string(prompt) do
            the_string = IO.gets(prompt) |> String.strip
            case the_string |> String.valid? do
              false ->
                IO.puts "Please enter a valid string."
                retrieve_string(prompt)
                true ->
                  the_string
                end
              end

            end