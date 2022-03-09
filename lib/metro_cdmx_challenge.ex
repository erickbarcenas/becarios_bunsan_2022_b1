defmodule MetroCDMXChallenge do
  import SweetXml

  defmodule Line do
    #defstruct name: "", stations:[] # con valor default para cada atributo
    defstruct [:name, :stations]
  end

  defmodule Station do
    defstruct [:name, :coords]
  end


  @doc """
  ## Examples
    iex> MetroCDMXChallenge.metro_lines
    [
      %Line{
        name: "Linea 1",
        stations: [
          %Station{name: "Pantitlan", coords: "90 30"},
        ]
      },
      %Line{
        name: "Linea 3",
        stations: [
          %Station{name: "Universidad", coords: "90 30"},
          %Station{name: "Copilco", coords: "90 30"},
        ]
      }
    ]
  """

  ### Main functions ###
  ## PART 1
  def metro_lines(xml_path) do
    xml = File.read!(xml_path)
    stations_aliases = get_stations_aliases(xml) # Retorna una lista con el nombre de las estaciones, ejemplo: ["1", "2", ...]
    every_station = get_all_stations(xml)

    stations = Enum.map(stations_aliases, fn station_name ->
      res = Enum.filter(every_station, fn item ->
        item.line == station_name
       end)
      Enum.map(res, fn item ->
        Map.delete(item, :line)
      end)
    end)

    Enum.map(0..(Enum.count(stations_aliases) - 1), fn idx ->
      %{
        name: Enum.at(stations_aliases, idx),
        stations: Enum.at(stations, idx)
      }
    end)
  end

  def get_stations_aliases(xml) do
    xml
    |> xpath(~x"//Document/Folder[1]/Placemark/name/text()"l)
    |> Enum.map(fn l ->
      List.to_string(l) |> String.split(" ") |> Enum.at(1)
     end)
  end

  ## PART 2

  def metro_graph() do #xml_path
    #lines = CDMXChallenge.metro_lines(xml_path)
    # Create graph ...
    g = Graph.new(type: :undirected)
    g
    |> Graph.add_edge("pantitlan", "hangares")
    |> Graph.add_edge("hangares", "puerto areo")
    |> Graph.add_edge("puerto areo", "oceania")
  end


  ### Analysis to obtain information from each station ###
  def get_all_stations(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[2]/Placemark"l,
      name: ~x"./name/text()",
      line: ~x"./description/text()",
      coords: ~x"./Point/coordinates/text()"
      )
    |> Enum.map(fn item -> mine_info_station(item) end)
  end
  def mine_info_station(item) do
    %{
       name: List.to_string(item.name) |> String.downcase() |> String.normalize(:nfd) |> String.replace(~r/[^a-z\s]/u, ""),
       line: List.to_string(item.line) |> String.split(".") |> Enum.at(0) |> String.split(" ") |> Enum.at(1),
       coords: "#{item.coords}"  |>  String.replace(~r"[a-z /]", "") |> String.replace("\n", "")
    }
   end

  ### Analysis to obtain information on each metro line ###
  def get_all_lines(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[1]/Placemark"l,
      line: ~x"./name/text()",
      coords: ~x"./LineString/coordinates/text()"
      )
    |> Enum.map(fn item -> mine_info_line(item) end)
  end
  def mine_info_line(item) do
    %{
       line: List.to_string(item.line) |> String.split(" ") |> Enum.at(1),
       coords: "#{item.coords}" |> String.split("\n") |> Enum.map(fn coord -> String.replace(coord, ~r"[a-z /]", "") end ) |> Enum.filter(fn x -> x != "" end)
    }
   end
end
