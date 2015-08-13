defmodule MadLib do
  def input(kind_of_word) do
    IO.gets("Enter #{kind_of_word}: ") |> String.strip
  end
  def go do
    IO.puts "You #{input("Verb")} your #{input("Adjective")} #{input("Noun")} #{input("Adverb")}? That hilarious!"
  end
end
MadLib.go
