defmodule MadLib do
  def verb do
    IO.gets("Enter a verb: ") |> String.strip
  end

  def adjective do
    IO.gets("Enter an adjective: ") |> String.strip
  end

  def noun do
    IO.gets("Enter a noun: ") |> String.strip
  end

  def adverb do
    IO.gets("Enter an adverb: ") |> String.strip
  end

  def go do
    IO.puts "You #{verb} your #{adjective} #{noun} #{adverb} down #{String.capitalize(noun)} Street? That hilarious!"
  end
end
MadLib.go
