# BecariosBunsan2022B1

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `becarios_bunsan_2022_b1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:becarios_bunsan_2022_b1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/becarios_bunsan_2022_b1>.


## Modules

### WordCount

compile the program
```
c "./lib/word_count.ex"
```


### ExUnit
```
mix test
```

```
..................

Finished in 0.1 seconds (0.00s async, 0.1s sync)
2 doctests, 16 tests, 0 failures

Randomized with seed 974807
```

```
mix test --trace
```

```
MyListsTest [test/my_list_test.exs]
  * test enter an empty list and any two parameters (0.00ms) [L#54]
  * test enter an empty list and a function (0.00ms) [L#17]
  * test when an empty array enters (0.00ms) [L#7]
  * test enter anything, an empty list and anything else (0.00ms) [L#59]
  * test enter an empty list and anything else [each] (0.00ms) [L#22]
  * test enter two not empty list (0.00ms) [L#48]
  * test enter an empty list and anything else (0.00ms) [L#38]
  * test enter two non-empty list (0.00ms) [L#64]
  * test enter a non-empty list an accumulator and a function (0.00ms) [L#32]
  * test enter anything else and an empty list (0.00ms) [L#43]
  * test enter a non-empty list and a function (0.00ms) [L#27]
  * test enter an empty list and anything else [map] (0.00ms) [L#12]

BecariosBunsan2022B1Test [test/becarios_bunsan2022_b1_test.exs]
  * doctest BecariosBunsan2022B1.hello/0 (1) (0.00ms) [L#3]
  * test greets the world (0.00ms) [L#5]

WordCountTest [test/word_count_test.exs]
  * doctest WordCount.read/1 (1) (15.5ms) [L#3]
  * test count the frequency of each word (0.2ms) [L#5]

FizzBuzzTest [test/fizz_buzz_test.exs]
  * test if number is 0, return 0 (0.00ms) [L#5]
  * test if number is positive integer, return [items] (2.2ms) [L#9]


Finished in 0.1 seconds (0.00s async, 0.1s sync)
2 doctests, 16 tests, 0 failures

Randomized with seed 512286
```

```
mix test --only map
```

```
Excluding tags: [:test]
Including tags: [:map]

...

Finished in 0.07 seconds (0.00s async, 0.07s sync)
2 doctests, 16 tests, 0 failures, 15 excluded

Randomized with seed 529931
```


```
env MIX_ENV=test mix coveralls
```

``` 
..................

Finished in 0.1 seconds (0.00s async, 0.1s sync)
2 doctests, 16 tests, 0 failures

Randomized with seed 115423
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/becarios_bunsan2022_b1.ex                  18        1        0
 77.8% lib/fizz_buzz.ex                               39        9        2
 85.7% lib/my_list.ex                                 44       14        2
100.0% lib/word_count.ex                              44        3        0
[TOTAL]  85.2%
----------------

```

```
env MIX_ENV=test mix coveralls.detail
```


