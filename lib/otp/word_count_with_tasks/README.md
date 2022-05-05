#

# iex

```elixir
iex> c "lib/otp/word_count_with_tasks/word_count_with_tasks.ex"
[WordCount]
```

It is recommended to use htop
```elixir
| Tasks? | 100000 lines | 300000 lines   |
-------------------------------------------|
|  No    |   7.7 seg     |     37  seg     |
|  Yes   |    3  seg     |     28.2 seg    |
```

## Frequencies tasks - 100k lines

```elixir
iex> WordCount.frequencies_tasks("data/word_count/aclimdb/train_100k.txt")
%{
  "obal" => 128,
  "summer" => 128,
  "at" => 1152,
  "smelled" => 128,
  "ended" => 128,
  "saying" => 768,
  "take" => 384,
  "uz" => 128,
  "work" => 512,
  "under" => 640,
  "understand" => 128,
  "cherubims" => 128,
  "shoulders" => 128,
  "riphath" => 128,
  "calah" => 256,
  "gomorrah" => 128,
  "now" => 1152,
  "whereof" => 128,
  "families" => 768,
  "fro" => 128,
  "process" => 128,
  "gather" => 128,
  "cainan" => 640,
  "respect" => 256,
  "became" => 384,
  "bethel" => 256,
  "title" => 128,
  "almodad" => 128,
  "ark" => 3328,
  "jerah" => 128,
  "eastward" => 128,
  "only" => 256,
  "again" => 768,
  "enter" => 128,
  "moveth" => 384,
  "rooms" => 128,
  "jobab" => 128,
  "judges" => 128,
  "prophet" => 384,
  "get" => 128,
  "kindred" => 128,
  "comest" => 128,
  "genesis" => 256,
  "offerings" => 128,
  "waters" => 4096,
  "trees" => 256,
  "place" => 256,
  "canaan" => 1280,
  "serug" => 512,
  "backward" => 256, 
  ...
}
```
## Frequencies tasks - 300k lines

```elixir
iex(8)> WordCount.frequencies_tasks("data/word_count/aclimdb/train_300k.txt")
%{
  "undo" => 512,
  "welcome" => 1536,
  "inevitably" => 512,
  "destruction" => 1024,
  "term" => 1536,
  "at" => 11776,
  "planet" => 512,
  "asis" => 512,
  "adding" => 512,
  "ended" => 512,
  "take" => 3072,
  "exact" => 512,
  "holds" => 512,
  "work" => 2560,
  "explore" => 1024,
  "under" => 6144,
  "natures" => 512,
  "heirs" => 512,
  "huts" => 512,
  "sundays" => 512,
  "bail" => 512,
  "run" => 1024,
  "understand" => 512,
  "republics" => 512,
  "engulf" => 512,
  "delegated" => 512,
  "fortunes" => 512,
  "injury" => 512,
  "forts" => 512,
  "atom" => 512,
  "georgia" => 512,
  "spellings" => 512,
  "symbolizing" => 512,
  "prepare" => 1024,
  "heritage" => 512,
  "bound" => 1024,
  "now" => 4096,
  "whereof" => 512,
  "battlefield" => 1024,
  "classes" => 512,
  "navy" => 512,
  "deny" => 512,
  "process" => 1024,
  "ocean" => 512,
  "owner" => 512,
  "contribution" => 512, 
  "piracies" => 512,
  "respect" => 512,
  "glow" => 512,
  "title" => 1536,
  ...
}
```
## Frequencies - 100k lines

```elixir
iex> WordCount.frequencies("data/word_count/aclimdb/train_100k.txt")
%{
  "tabernacle" => 328,
  "obal" => 1,
  "ladies" => 2,
  "siloah" => 1,
  "undo" => 2,
  "turtles" => 3,
  "gehazi" => 12,
  "graving" => 3,
  "summer" => 27,
  "arelites" => 1,
  "cosam" => 1,
  "maadai" => 1,
  "reign" => 168,
  "interpreted" => 11,
  "twinkling" => 1,
  "forsomuch" => 1,
  "washpot" => 2,
  "pressed" => 15,
  "pierce" => 4,
  "wrathful" => 2,
  "woollen" => 6,
  "waxen" => 12,
  "tales" => 2,
  "esteeming" => 1,
  "bizjothjah" => 1,
  "perceiveth" => 3,
  "destruction" => 94,
  "philadelphia" => 2,
  "favour" => 70,
  "merom" => 2,
  "at" => 1573,
  "emulations" => 1,
  "lydia" => 3,
  "destroyer" => 7,
  "revealer" => 1,
  "zithri" => 1,
  "delayeth" => 2,
  "smelled" => 2,
  "ranging" => 1,
  "abounded" => 5,
  "ashbel" => 3,
  "sirah" => 1,
  "likhi" => 1,
  "purchase" => 8,
  "assented" => 1,
  "bewrayeth" => 3,
  "hereunto" => 2,
  "sit" => 113,
  "kiriathaim" => 4,
  "jehudijah" => 1,
  ...
}

```
## Frequencies - 300k lines

```elixir
iex> WordCount.frequencies("data/word_count/aclimdb/train_300k.txt")
%{
  "tabernacle" => 970,
  "obal" => 3,
  "ladies" => 6,
  "siloah" => 3,
  "precipitate" => 1,
  "undo" => 8,
  "turtles" => 9,
  "gehazi" => 36,
  "graving" => 9,
  "summer" => 81,
  "arelites" => 3,
  "cosam" => 3,
  "recommend" => 2,
  "maadai" => 3,
  "reign" => 499,
  "welcome" => 12,
  "interpreted" => 33,
  "twinkling" => 3,
  "forsomuch" => 3,
  "washpot" => 6,
  "pressed" => 45,
  "pierce" => 14,
  "inevitably" => 2,
  "wrathful" => 6,
  "woollen" => 18,
  "waxen" => 36,
  "tales" => 6,
  "esteeming" => 2,
  "bizjothjah" => 3,
  "perceiveth" => 9,
  "destruction" => 283,
  "term" => 11,
  "philadelphia" => 4,
  "favour" => 210,
  "merom" => 6,
  "at" => 4771,
  "emulations" => 3,
  "lydia" => 9,
  "consulsto" => 2,
  "destroyer" => 21,
  "revealer" => 3,
  "immunities" => 3,
  "zithri" => 3,
  "planet" => 2,
  "delayeth" => 6,
  "smelled" => 6,
  "ranging" => 3,
  "abounded" => 15,
  "ashbel" => 9,
  "ebooksverend" => 2,
  ...
}
```
