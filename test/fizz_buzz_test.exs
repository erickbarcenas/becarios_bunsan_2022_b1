defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "if number is 0, return 0" do
    assert FizzBuzz.fizzBuzz(0) == 0
  end

  test "if number is positive integer, return [items]" do
    expected_result = [1, 2, :Fizz, 4, :Buzz, :Fizz]
    assert FizzBuzz.fizzBuzz(6) == expected_result
  end
end
