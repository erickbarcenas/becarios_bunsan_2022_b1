defmodule WordCountTest do
  use ExUnit.Case
  doctest WordCount

  test "count the frequency of each word" do
    assert WordCount.count("./data/word_count/mytext.txt") == %{
      "esto" => 2,
      "como" => 1,
      "dos" => 1,
      "estan" => 1,
      "hola" => 1,
      "repite" => 1,
      "se" => 1,
      "veces" => 1
    }
  end
end

