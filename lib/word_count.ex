defmodule WordCount do

  def read(filename) do
    # Reading from the text file
    document = File.read!(filename)
    File.close(filename)
    document
  end

  def clean(word) do
    word
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-z\s]/u, "")
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
  end

  @spec map(binary) :: any
  def map(document) do
    document
    |> String.split("\n")
    |> Enum.map(fn word-> clean(word) end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    #|> String.split(~r{(\\n|[^\w'])+})
    #|> Enum.filter(fn x -> x != "" end)
    #|> Enum.count() |> IO.puts()
  end

  def count(filename) do
    read(filename)
    |> map()
  end
end


#iex -S mix
