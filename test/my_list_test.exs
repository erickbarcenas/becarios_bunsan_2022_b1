defmodule MyListsTest do
  use ExUnit.Case
  doctest MyLists

  @tag :map
  @tag timeout: 0.09
  test "when an empty array enters" do
    assert MyLists.map([]) == []
  end
  @tag :map
  @tag timeout: 0.09
  test "enter an empty list and anything else" do
    assert MyLists.map([], 0) == []
  end
  @tag :map
  @tag timeout: 0.08
  test "enter an empty list and a function" do
    assert MyLists.map([1, 2, 3], fn number -> number * 2 end) == [2, 4, 6]
  end



end
