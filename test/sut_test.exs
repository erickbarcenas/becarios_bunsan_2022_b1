defmodule SUTTest do
    use ExUnit.Case
    doctest SUT

    data = [
      {1, 3, 4},
      {7, 4, 11}, # Error intencional
      {1, 1, 2},
      {2, 2, 4},
      {3, 3, 6},
    ]
    for {a,b,c} <- data do
      @a a
      @b b
      @c c
      test "sum of #{@a} and #{@b} should equal #{@c}" do  
        assert SUT.sum(@a,@b) == @c 
      end
    end
end