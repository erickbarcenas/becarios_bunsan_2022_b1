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

  def join_the_maps(data) do
    reduction =
      data
      |> Enum.chunk_every(2)
      |> Enum.map(fn pair ->
        cond do
          Enum.count(pair) == 2 ->
            a = Enum.at(pair, 0)
            b = Enum.at(pair, 0)
            Map.merge(a, b, fn _k, v1, v2 -> v1 + v2 end)

          true ->
            Enum.at(pair, 0)
        end
      end)

    if Enum.count(reduction) == 1 do
      reduction
      |> Enum.at(0)
    else
      join_the_maps(reduction)
    end
  end

  def frequencies_tasks(path) do
    path
    |> File.stream!()
    |> Enum.chunk_every(1_000)
    |> Enum.map(fn lines -> Task.async(fn -> word_count(Enum.join(lines)) end) end)
    |> Enum.map(fn task -> Task.await(task) end)
    |> join_the_maps()
  end

  def frequencies(path) do
    File.read!(path)
    |> word_count()
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
