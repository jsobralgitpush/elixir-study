defmodule FizzBuzz do
  def build(file_name) do
    File.read(file_name)
    |> try_to_read_file()
  end

  def try_to_read_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> fizz_buzz()

    {:ok, result}
  end

  def try_to_read_file({:error, reason}), do: {:error, "Deu ruim aqui oh: #{reason}"}

  def fizz_buzz(list) do
    list
    |> Enum.map(&convert_and_evaluate_numbers/1)
  end

  def convert_and_evaluate_numbers(number) do
    number
    |> String.to_integer()
    |> evaluate_number()
  end

  def evaluate_number(elem) when rem(elem, 15) == 0, do: "FizzBuzz"
  def evaluate_number(elem) when rem(elem, 3) == 0, do: "Fizz"
  def evaluate_number(elem) when rem(elem, 5) == 0, do: "Buzz"
  def evaluate_number(elem), do: elem
end
