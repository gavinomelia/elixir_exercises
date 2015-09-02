  name = IO.gets("What is you name? ") |> String.strip
  case name do
    "Gavin" -> IO.puts "Hello, Gavin, you are totaly awesome!"
    "Luke" -> IO.puts "Hello, Luke, you are not awesome!"
    _ -> IO.puts "Hello, #{name}, nice to meet you!"
  end
