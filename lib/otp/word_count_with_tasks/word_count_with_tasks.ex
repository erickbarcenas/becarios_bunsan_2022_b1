defmodule WordCount do
  @moduledoc """
    Documentation for `WordCount`: 
    count the number of times a word is repeated
    ## Example
      iex> WordCount.count("./data/word_count/mytext.txt")
      %{
        "esto" => 2,
        "como" => 1,
        "dos" => 1,
        "estan" => 1,
        "hola" => 1,
        "repite" => 1,
        "se" => 1,
        "veces" => 1
      }
  """

  def frequencies_tasks(path) do
    path
    |> File.stream!()
    |> Enum.chunk_every(1_000)
    |> Enum.map(fn lines -> Task.async(fn -> word_count(Enum.join(lines)) end) end)
    |> Enum.map(fn task -> Task.await(task) end)
    # Join the maps
  end

  def frequencies(path) do
    File.read!(path)
    |> word_count()
    # Join the maps
  end

  def word_count(text) do
    text
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-z\s]/u, "")
    |> String.downcase()
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    |> List.flatten()
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, fn freq -> freq + 1 end)
    end)
  end
end
