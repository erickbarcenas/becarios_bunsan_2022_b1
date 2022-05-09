defmodule WordCount do
  @moduledoc """
    Documentation for `WordCount`
  """

  @doc """
  WordCount

  ## Examples

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

  def count(filename) do
    File.read!(filename)
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-z\s]/u, "")
    |> String.downcase()
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    |> List.flatten()
    |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, fn freq -> freq + 1 end) end)
  end
end

# iex -S mix
