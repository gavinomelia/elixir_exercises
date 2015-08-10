quotation = IO.gets("What is the quote? ") |> String.strip
person = IO.gets("Who said it? ") |> String.strip
IO.puts(person <> " says, \"" <> quotation <> " \"")
