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


## Commands
```elixir
mix deps.get
```

```elixir
iex (-S mix)
```

## Modules


## CDMXChallenge

```
iex> CDMXChallenge.metro_lines("./data/cdmx_challenge/cdmx_challenge.kml")
[
  %{
    name: "1",
    stations: [
      %{coords: "-99.102264,19.4232414,0", name: "balbuena"},
      %{coords: "-99.0960038,19.4197101,0", name: "boulevard puerto aereo"},
      %{coords: "-99.1762608,19.420813,0", name: "chapultepec"},
      %{coords: "-99.154653,19.425867,0", name: "cuauhtemoc"},
      %{coords: "-99.0903497,19.4164114,0", name: "gomez farias"},
      %{coords: "-99.1627908,19.4236259,0", name: "insurgentes"},
      %{coords: "-99.1374546,19.4265399,0", name: "isabel la catolica"},
      %{coords: "-99.1821724,19.4129053,0", name: "juanacatlan"},
      %{coords: "-99.2005488,19.3982501,0", name: "observatorio"},
      %{coords: "-99.1246551,19.4254927,0", name: "merced"},
      %{coords: "-99.1102624,19.4272178,0", name: "moctezuma"},
      %{coords: "-99.1706067,19.421926,0", name: "sevilla"},
      %{coords: "-99.0823781,19.412288,0", name: "zaragoza"}
    ]
  },
  %{
    name: "2",
    stations: [
      %{coords: "-99.1369029,19.4356521,0", name: "allende"},
      %{coords: "-99.1718835,19.4489852,0", name: "colegio militar"},
      %{coords: "-99.214788,19.4634108,0", name: "cuatro caminos"},
      %{coords: "-99.182151,19.457488,0", name: "cuitlahuac"},
      %{coords: "-99.1429317,19.3619032,0", name: "ermita"},
      %{coords: "-99.1449916,19.353284,0", name: "general anaya"},
      %{coords: "-99.203158,19.4587829,0", name: "panteones"},
      %{coords: "-99.140260219574,19.3795146127671,0", name: "nativitas"},
      %{coords: "-99.1673774,19.4447058,0", name: "normal"},
      %{coords: "-99.1747749,19.4521567,0", name: "popotla"},
      %{coords: "-99.1415638,19.369945,0", name: "portales"},
      %{coords: "-99.1555005,19.4397232,0", name: "revolucion"},
      %{coords: "-99.1345682,19.416019,0", name: "san antonio abad"},
      %{coords: "-99.1611063,19.441782,0", name: "san cosme"},
      %{coords: "-99.142524,19.3441988,0", name: "tasquena"},
      %{coords: "-99.1368914,19.4008785,0", name: "viaducto"},
      %{coords: "-99.1390371,19.3874695,0", name: "villa de cortes"},
      %{coords: "-99.1378087,19.3952064,0", name: "xola"},
      %{coords: "-99.1329861,19.4332227,0", name: "zocalo"}
    ]
  },
  %{
    name: "3",
    stations: [
      %{coords: "-99.1766363,19.3359178,0", name: "copilco"},
      %{coords: "-99.1704994,19.3614528,0", name: "coyoacan"},
      %{coords: "-99.1591108,19.3798486,0", name: "division del norte"},
      %{
        coords: "-99.1562569,19.3956264,0",
        name: "etiopia  plaza de la transparencia"
      },
      %{coords: "-99.1574532,19.3855061,0", name: "eugenia"},
      %{coords: "-99.1538858,19.4135984,0", name: "hospital general"},
      %{coords: "-99.1194999,19.4953987,0", name: "indios verdes"},
      %{coords: "-99.1478777,19.4332682,0", name: "juarez"},
      %{coords: "-99.1505706,19.4195583,0", name: "ninos heroes"},
      %{
        coords: "-99.1810191,19.3468358,0",
        name: "miguel angel de quevedo av universidad"
      },
      %{coords: "-99.1321707,19.4769704,0", name: "potrero"},
      %{coords: "-99.1427922,19.4551006,0", name: "tlatelolco"},
      %{coords: "-99.1739595,19.3244574,0", name: "universidad"},
      %{coords: "-99.1760355,19.3537143,0", name: "viveros"},
      %{coords: "-99.1649204,19.3707294,0", name: "zapata"}
    ]
  },
  %{
    name: "4",
    stations: [
      %{coords: "-99.1119307,19.4647057,0", name: "bondojito"},
      %{coords: "-99.1161579,19.4488638,0", name: "canal del norte"},
      %{coords: "-99.1205406,19.4216528,0", name: "fray servando"},
      %{coords: "-99.1217637,19.4091258,0", name: "jamaica"},
      %{coords: "-99.1216993,19.4027355,0", name: "santa anita"},
      %{coords: "-99.1080093,19.4743304,0", name: "talisman"}
    ]
  },
  %{
    name: "5",
    stations: [
      %{coords: "-99.0963578,19.4511957,0", name: "aragon"},
      %{coords: "-99.1407001,19.4790945,0", name: "autobuses del norte"},
      %{coords: "-99.105413,19.4514081,0", name: "eduardo molina"},
      %{coords: "-99.0874207,19.4240913,0", name: "hangares"},
      %{coords: "-99.1449058,19.4896945,0", name: "instituto del petroleo"},
      %{coords: "-99.1307974,19.4634058,0", name: "misterios"},
      %{coords: "-99.0871739,19.4457529,0", name: "oceania"},
      %{coords: "-99.1492832,19.5008499,0", name: "politecnico"},
      %{coords: "-99.0876889,19.4338247,0", name: "terminal aerea"},
      %{coords: "-99.1193229,19.458798,0", name: "valle gomez"}
    ]
  },
  %{
    name: "6",
    stations: [
      %{coords: "-99.1864371,19.4910143,0", name: "azcapotzalco"},
      %{coords: "-99.2000628,19.5046121,0", name: "el rosario"},
      %{coords: "-99.17382,19.4908171,0", name: "ferreria"},
      %{
        coords: "-99.1179228,19.4815524,0",
        name: "la villa  basilica de guadalupe"
      },
      %{coords: "-99.1346973,19.4877576,0", name: "lindavista"},
      %{coords: "-99.1627693,19.488683,0", name: "norte "},
      %{coords: "-99.1962701,19.495065,0", name: "tezozomoc"},
      %{coords: "-99.1555542,19.4903266,0", name: "vallejo"}
    ]
  },
  %{
    name: "7",
    stations: [
      %{coords: "-99.1948807,19.4905036,0", name: "aquiles serdan"},
      %{coords: "-99.1919732,19.4255433,0", name: "auditorio"},
      %{coords: "-99.189586,19.3607037,0", name: "barranca del muerto"},
      %{coords: "-99.19016,19.479226,0", name: "camarones"},
      %{coords: "-99.1912866,19.4119136,0", name: "constituyentes"},
      %{coords: "-99.1910237,19.4335161,0", name: "polanco"},
      %{coords: "-99.1878051,19.3761645,0", name: "mixcoac"},
      %{coords: "-99.1905999,19.4700922,0", name: "refineria"},
      %{coords: "-99.1863245,19.3847724,0", name: "san antonio"},
      %{coords: "-99.1918445,19.4458136,0", name: "san joaquin"},
      %{coords: "-99.1860509,19.3912798,0", name: "san pedro de los pinos"}
    ]
  },
  %{
    name: "8",
    stations: [
      %{coords: "-99.1077197,19.3737557,0", name: "aculco"},
      %{coords: "-99.1095865,19.3793223,0", name: "apatlaco"},
      %{coords: "-99.1013199,19.3561791,0", name: "atlalilco"},
      %{coords: "-99.085511,19.3560526,0", name: "cerro de la estrella"},
      %{coords: "-99.0638816,19.3459804,0", name: "constitucion de "},
      %{coords: "-99.1135132,19.398551,0", name: "coyuya"},
      %{coords: "-99.1433448,19.4216528,0", name: "doctores"},
      %{coords: "-99.1091895,19.3650309,0", name: "escuadron "},
      %{coords: "-99.1392624,19.4427583,0", name: "garibaldi"},
      %{coords: "-99.1122043,19.3886637,0", name: "iztacalco"},
      %{coords: "-99.0934932,19.3578999,0", name: "iztapalapa"},
      %{coords: "-99.1262913,19.4065657,0", name: "la viga"},
      %{coords: "-99.1441816,19.4133303,0", name: "obrera"},
      %{coords: "-99.141494,19.4312447,0", name: "san juan de letran"},
      %{coords: "-99.0747285,19.3507281,0", name: "uami"}
    ]
  },
  %{
    name: "9",
    stations: [
      %{coords: "-99.1684502,19.406171,0", name: "chilpancingo"},
      %{coords: "-99.0912294,19.4084529,0", name: "ciudad deportiva"},
      %{coords: "-99.1448736,19.407021,0", name: "lazaro cardenas"},
      %{coords: "-99.1788948,19.4062317,0", name: "patriotismo"},
      %{coords: "-99.0824747,19.4072234,0", name: "puebla"},
      %{coords: "-99.1128802,19.4085693,0", name: "mixiuhca"},
      %{coords: "-99.1030419,19.4085693,0", name: "velodromo"}
    ]
  },
  %{ 
    name: "A",
    stations: [
      %{coords: "-99.0056777,19.3647171,0", name: "acatitla"},
      %{coords: "-99.0698737,19.4047948,0", name: "agricola oriental"},
      %{coords: "-99.0593863,19.3987332,0", name: "canal de san juan"},
      %{coords: "-99.0356326,19.3851316,0", name: "guelatao"},
      %{coords: "-98.9609921,19.3506572,0", name: "la paz"},
      %{coords: "-98.9768708,19.3590285,0", name: "los reyes"},
      %{coords: "-99.0170825,19.3733205,0", name: "penon viejo"},
      %{coords: "-98.9952278137207,19.3613566081823,0", name: "santa maria"},
      %{coords: "-99.0463722,19.3912849,0", name: "tepalcates"}
    ]
  },
  %{
    name: "B",
    stations: [
      %{coords: "-99.0692568,19.4581051,0", name: "bosque de aragon"},
      %{coords: "-99.027347266674,19.5344532308002,0", name: "ciudad azteca"},
      %{coords: "-99.079417,19.450963,0", name: "deportivo oceania"},
      %{coords: "-99.0488827,19.4858612,0", name: "impulsora"},
      %{coords: "-99.1313499,19.4433754,0", name: "lagunilla"},
      %{coords: "-99.0333796,19.5213181,0", name: "olimpica"},
      %{coords: "-99.041968,19.5017045,0", name: "muzquiz"},
      %{coords: "-99.0545368,19.4730559,0", name: "nezahualcoyotl"},
      %{coords: "-99.0301716,19.5284976,0", name: "plaza aragon"},
      %{coords: "-99.1036642,19.436607,0", name: "ricardo flores magon"},
      %{coords: "-99.0466619,19.4909688,0", name: "rio de los remedios"},
      %{coords: "-99.0943193,19.4408057,0", name: "romero rubio"},
      %{coords: "-99.0359974,19.5153316,0", name: "tecnologico"},
      %{coords: "-99.1233194,19.4425205,0", name: "tepito"},
      %{coords: "-99.0613174,19.4616861,0", name: "villa de aragon"}
    ] 
  },
  %{
    name: "12",
    stations: [
      %{coords: "-99.085865020752,19.3204785190829,0", name: "calle "},
      %{coords: "-99.1075731,19.3382167,0", name: "culhuacan"},
      %{coords: "-99.1500341892242,19.3693022493275,0", name: "eje central"},
      %{
        coords: "-99.171416759491,19.3720957839934,0",
        name: "hospital  de noviembre"
      },
      %{coords: "-99.1789698600769,19.373684838504,0", name: "insurgentes sur"},
      %{coords: "-99.0977311134338,19.3224426830973,0", name: "lomas estrella"},
      %{coords: "-99.0505456924438,19.3008760842049,0", name: "nopalera"},
      %{
        coords: "-99.1557097434998,19.3701423390627,0",
        name: "parque de los venados"
      },
      %{
        coords: "-99.0755867958069,19.3184940819814,0",
        name: "periferico oriente"
      },
      %{coords: "-99.1215705871582,19.3574291928694,0", name: "mexicaltzingo"},
      %{coords: "-99.0605020523071,19.3047441060938,0", name: "olivos"},
      %{coords: "-99.1051529,19.3276583,0", name: "san andres tomatlan"},
      %{coords: "-99.0698146820068,19.3095233157067,0", name: "tezonco"},
      %{coords: "-99.0240240097046,19.2980205748147,0", name: "tlaltenco"},
      %{coords: "-99.0174150466919,19.2906891806738,0", name: "tlahuac"},
      %{coords: "-99.0417265892029,19.2992559431495,0", name: "zapotitlan"}
    ]
  }
]

```

### WordCount

compile the program
```
c "./lib/cdmx_challenge.ex"
```

```
c "./lib/sweet_xml_examples.ex"
```

```
c "./lib/word_count.ex"
```

```
c "./lib/my_list.ex"
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




## Examples
```elixir
KeywordList
[{:one, 1}, {:two, 2}, {:three, 3}]
```

```elixir
Graph.new
```

```elixir
" a dddd hdhdhd " |> String.split("", parts:5, trim: true)
```

```elixir
" a dddd hdhdhd " |> String.split("", trim: true)
```


Comprehensions

```elixir
for x <- [1, 2, 3] do
  x * x
end
```


```elixir
for x <- ["1", "2", "3"], y <- [%{coords: []}, %{coords: []}, %{coords: []}] do
  %{
    name: x
    coords: []}
end
```

```elixir
for x <- [1, 2, 3], y <- [:a, :b, :c], z <- ["one", "two"] do
  {x, y, z}
end
```

```elixir
for x <- 1..10, y <- 1..10, rem(x * y, 2) == 0, do: {x, y}
```


```elixir
defmodule Blob do
  defstruct 
end

iex> b = %Blob{content: 123}

Tarea: Diferencia entre puts e inspect
IO.puts vs inspect
```


  # alias CDMXChallenge.Line
  # %Lines{}

  # pantitlan = %Station{name: "Pantitlan", coords: {0.123, 90.123}}
  # hangares = %Station{name: "Pantitlan", coords: {0.123, 90.123}}
  # linea_5 = %Line{name: "Línea 5", stations: [pantitlan, hangares]}
  # alias CDMXChallenge.Station


  # defmodule Foo do
  #  def get_coords(s = %{})
  # end

