defmodule MyListsTest do
  use ExUnit.Case
  doctest MyLists

  @tag :map
  # @tag timeout: 0.09
  test "when an empty array enters" do
    assert MyLists.map([]) == []
  end
  @tag :map
  # @tag timeout: 0.09
  test "enter an empty list and anything else [map]" do
    assert MyLists.map([], 0) == []
  end
  @tag :map
  # @tag timeout: 0.08
  test "enter an empty list and a function" do
    assert MyLists.map([1, 2, 3], fn number -> number * 2 end) == [2, 4, 6]
  end

  @tag :each
  test "enter an empty list and anything else [each]" do
    assert MyLists.each([], 0) == nil
  end

  #@tag :each
  #test "enter a non-empty list and a function" do
  #  test_cases = %{
  #    "foo" => 1,
  #    "bar" => 2,
  #    "baz" => 3,
  #  }

  #  Enum.each(test_cases, fn({input, expected_output}) ->
  #    test "for #{input}" do
  #      assert(Mymodule.myfunction input) == expected_output
  #    end
  #  end)

    assert MyLists.each([1], fn x-> IO.puts(x*2) end) == [2, 4,6]
  end

  @tag :reduce
  test "enter a non-empty list an accumulator and a function" do
    assert MyLists.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end) == 16
  end


  @tag :zip
  test "enter an empty list and anything else" do
    assert MyLists.zip([], 0) == []
  end

  @tag :zip
  test "enter anything else and an empty list" do
    assert MyLists.zip([], 0) == []
  end

  @tag :zip
  test "enter two not empty list" do
    assert MyLists.zip([1, 2, 3, 4, 5], [:a, :b, :c]) == [{1, :a}, {2, :b}, {3, :c}]
  end


  @tag :zip_with
  test "enter an empty list and any two parameters" do
    assert MyLists.zip_with([], 0, 0) == []
  end

  @tag :zip_with
  test "enter anything, an empty list and anything else" do
    assert MyLists.zip_with(0, [], 0) == []
  end

  @tag :zip_with
  test "enter two non-empty list" do
    assert MyLists.zip_with([1, 2], [3, 4], fn x, y -> x + y end) == [4, 6]
  end

end
