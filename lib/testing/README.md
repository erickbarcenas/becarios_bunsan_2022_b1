# InvoiceValidator



### Ejemplos
```elixir
iex> emisor_date = DateTime.from_naive!(~N[2022-10-20 14:16:35], "Mexico/BajaNorte")
#DateTime<2022-10-20 14:16:35-07:00 PDT Mexico/BajaNorte>


iex> pac_date = DateTime.from_naive!(~N[2022-10-20 15:16:35], "Mexico/BajaSur")     
#DateTime<2022-10-20 15:16:35-06:00 MDT Mexico/BajaSur>


iex> InvoiceValidator.validate_dates(emisor_date, pac_date)
:ok
```

### Testing (ExUnit)
```
mix test
```

### Pruebas de cobertura (excoveralls)

```
env MIX_ENV=test mix coveralls
```

***Resultados***
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