# Diferencia entre puts e inspect

## IO.puts/2.
Acepta el tipo de datos to_string/1, lo imprime y retorna un atom :ok,
No acepta listas, mapas, estructuras o funciones.

```elixir 
iex> IO.puts("Hello world")
"Hello world"
:ok
```


## IO.inspect/2 e IO.inspect/3.
Acepta cualquier tipo de dato,
lo imprime y retorna el tipo de dato.


```elixir 
iex> IO.inspect("Hello world")
"Hello world"
"Hello world"
```

Ejemplo de uso:
```elixir 
"data"
|> some_function()
|> some_other_function()
|> IO.inspect() # Your data flow will be uninterrupted
|> third_function()
```

[[1]T. Fartek, “When to use elixir’s IO.Puts and when IO.Inspect - Timotej fartek,” Medium, 08-Sep-2019. [Online]. Available: https://medium.com/@timotejfartek/when-to-use-elixirs-io-puts-and-when-io-inspect-6eb005d80d90. [Accessed: 09-Mar-2022]](https://medium.com/@timotejfartek/when-to-use-elixirs-io-puts-and-when-io-inspect-6eb005d80d90)
