defmodule CDMXChallenge do
  import SweetXml
  @doc """

  ## Examples
    iex> CDMXChallenge.metro_lines
    [
      %{
        name: "Linea 1",
        stations: [
          %{name: "Pantitlan", coords: "90 30"},
        ]
      },
      %{
        name: "Linea 3",
        stations: [
          %{name: "Universidad", coords: "90 30"},
          %{name: "Copilco", coords: "90 30"},
        ]
      }
    ]
  """



  # Firts Part
  # PER STATION
  def mine_information_every_station(item) do
    %{
       name: List.to_string(item.name) |> String.downcase() |> String.normalize(:nfd) |> String.replace(~r/[^a-z\s]/u, ""),
       line: List.to_string(item.line) |> String.split(".") |> Enum.at(0) |> String.split(" ") |> Enum.at(1),
       coordinates: "#{item.coordinates}"  |>  String.replace(~r"[a-z /]", "") |> String.replace("\n", "")
    }
   end

  def get_all_information_every_station(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[2]/Placemark"l,
      name: ~x"./name/text()",
      line: ~x"./description/text()",
      coordinates: ~x"./Point/coordinates/text()"
      )
    |> Enum.map(fn item -> CDMXChallenge.mine_information_every_station(item) end)

  end


  # PER LINE



  def mine_information_every_line(item) do
    %{
       line: List.to_string(item.line) |> String.split(" ") |> Enum.at(1),
       coordinates: "#{item.coordinates}" |> String.split("\n") |> Enum.map(fn coord -> String.replace(coord, ~r"[a-z /]", "") end ) |> Enum.filter(fn x -> x != "" end)
    }
   end

  def get_all_information_every_line(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[1]/Placemark"l,
      line: ~x"./name/text()",
      coordinates: ~x"./LineString/coordinates/text()"
      )
    |> Enum.map(fn item -> mine_information_every_line(item) end)
  end



  def metro_lines(xml_path) do

    base = ["1", "2", "3", "4", "5", "6",
    "7", "8", "9", "A", "B", "12"]

    xml = File.read!(xml_path)
    every_station = CDMXChallenge.get_all_information_every_station(xml)
    # every_line = CDMXChallenge.get_all_information_every_line(xml)


    Enum.map(base, fn number ->
      Enum.filter(every_station, fn item -> item.line == number end)
    end)


  end


  # List.to_string

  # def metro_graph(xml_path) do
  #  lines = CDMXChallenge.metro_lines(xml_path)
  #  # Create graph ...
  # end


end
