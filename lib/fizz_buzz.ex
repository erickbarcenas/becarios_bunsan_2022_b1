defmodule FizzBuzz do
  @moduledoc """
    The FizzBuzz problem
  """

  @typep result :: integer | :Fizz | :Buzz | :FizzBuzz


#  def number_or_text(value) do
#    cond do
#      rem(value, 3) == 0 && rem(value, 5) == 0 -> :FizzBuzz
#      rem(value, 3) == 0 -> :Fizz
#      rem(value, 5) == 0 -> :Buzz
#      true -> value
#    end
#  end

defp check(number) when is_integer(number) do
  case {rem(number, 3), rem(number, 5), number} do
    {0, 0, 0} -> 0
    {0, 0, _} -> :FizzBuzz
    {0, _, _} -> :Fizz
    {_, 0, _} -> :Buzz
    {_, _, _} -> number
  end
end


  @spec fizzBuzz(integer) :: result | [result]
  def fizzBuzz(stop) do
    if stop == 0 do
      0
    else
      Enum.map(1..stop, fn number ->
        check(number)
      end)
    end
  end
end
