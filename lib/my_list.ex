defmodule MyLists do
  @moduledoc """
    Funciones equivalentes a las que existen en el módulo Enum. implementadas con recursión.
  """

  def map([]), do: []
  def map([], _), do: []
  def map([h | t], fun), do: [fun.(h) | map(t, fun)]

  def each([], _), do: nil

  def each([h | t], fun) do
    fun.(h)
    each(t, fun)
  end

  def reduce([], acc, _), do: acc

  def reduce([h | t], acc, fun) do
    reduce(t, fun.(h, acc), fun)
  end

  def zip([], _), do: []
  def zip(_, []), do: []

  def zip([h1 | t1], [h2 | t2]) do
    [{h1, h2} | zip(t1, t2)]
  end

  def zip_with([], _, _), do: []
  def zip_with(_, [], _), do: []
  def zip_with([h1 | t1], [h2 | t2], fun), do: [fun.(h1, h2) | zip_with(t1, t2, fun)]
end

# def each([h | t], fun) do
#  [fun.(h) | each(t)]
# end

# MyLists.each([1,2,3,4,5], fn x-> IO.puts(x*2) end)
# MyLists.map([1,2,3,4,5], fn x-> x*2 end)
# MyLists.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)

# MyLists.zip([a, b, c], [1, 2, 3])
