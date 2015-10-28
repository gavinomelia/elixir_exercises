defmodule LegalDrivingAge.B do
  import InputRetriever

  def go do
    country_map = %{
      :United_States => 16,
      :Mexico => 16,
      :El_Salvador => 15,
      :Cuba => 18,
      :Iran => 18,
      :United_Kindom => 17
    }
    IO.inspect country_map
    age = retrieve("What is your age? ")
    if age < 16, do: IO.puts("You are not old enough to legaly drive."), else: IO.puts "You are old enough to legally drive."
    end
end
