defmodule PasswordValidation.A do
  @credentials %{:username => "Joe", :password => "Abc123"}

  def get_credentials do
    input_username = IO.gets("What is the username? ") |> String.strip
    input_password = IO.gets("What is the password? ") |> String.strip
    %{:username => input_username, :password => input_password}
  end

  def go do
    if @credentials == get_credentials do
      IO.puts "Welcome!"
    else
      IO.puts "I don't know you."
    end
  end
end
