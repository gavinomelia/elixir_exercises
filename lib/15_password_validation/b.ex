defmodule PasswordValidation.B do
  import Comeonin.Bcrypt
  @credentials %{:username => "Joe", :password => "Abc123"}

  defp get_credentials do
    input_username = IO.gets("What is the username? ") |> String.strip
    input_password = IO.gets("What is the password? ") |> String.strip |> hashpwsalt
    %{:username => input_username, :password => input_password}
  end

  defp credentials_match? do
    get = get_credentials
    check_username = @credentials.username == get.username
    check_username && checkpw(@credentials.password, get.password)
  end

  def go do
    credentials_match? |> welcome_message
  end

  defp welcome_message(true), do: IO.puts "Welcome!"
  defp welcome_message(false), do: IO.puts "I don't know you."
end
