defmodule LegalDrivingAge.A do
  import InputRetriever

  def go do
    age = retrieve("What is your age? ")
    if age < 16, do: IO.puts("You are not old enough to legaly drive."), else: IO.puts "You are old enough to legally drive."
    end
end
