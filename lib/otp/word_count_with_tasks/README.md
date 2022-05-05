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


```
## Frequencies tasks - 300k lines

```elixir
iex(8)> WordCount.frequencies_tasks("data/word_count/aclimdb/train_300k.txt")

```
## Frequencies - 100k lines

```elixir
iex> WordCount.frequencies("data/word_count/aclimdb/train_300k.txt")

```
## Frequencies - 300k lines

```elixir
iex> WordCount.frequencies("data/word_count/aclimdb/train_300k.txt")

```
