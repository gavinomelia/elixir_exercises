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

          def retrieve_string(prompt, list) do
            the_string = IO.gets(prompt) |> String.strip |> String.upcase
            case Enum.member?(list, the_string) do
              false ->
                IO.puts "Please enter a valid string."
                retrieve_string(prompt, list)
                true ->
                  the_string
                end
              end

              def retrieve_string(prompt) do
                the_string = IO.gets(prompt) |> String.strip |> String.upcase
              end

            end