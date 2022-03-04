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
### How to use the function?

```elixir
iex(44)> WordCount.count("./lib/mytext.txt")
%{
  "Agustin" => 1,
  "Amir" => 1,
  "Esto" => 2,
  "como" => 1,
  "dos" => 1,
  "estan" => 1,
  "hola" => 1,
  "repite" => 1,
  "se" => 1,
  "veces" => 1,
  "y" => 1
}
```
