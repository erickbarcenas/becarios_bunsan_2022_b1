defmodule Calculator do
  @moduledoc """
  The arithmetic operations of a calculator: 
  addition, subtraction, multiplication and division
  """

  def init(), do: calc(0)

  def calc(current_value) do
    receive do
      {:state, pid} ->
        send(pid, current_value)
        current_value

      {:sum, value} ->
        current_value + value

      {:sub, value} ->
        current_value - value

      {:mult, value} ->
        current_value * value

      {:div, value} ->
        current_value / value

      _ ->
        IO.puts("Invalid request")
    end
    |> calc()
  end
end
