defmodule CDMXChallenge do
  import SweetXml

  defmodule Line do

    #defstruct name: "", stations:[] # con valor default para cada atributo
    defstruct [:name, :stations]
  end


  #alias CDMXChallenge.Line
  #%Lines{}


  defmodule Station do
    defstruct [:name, :coords]
  end

  # pantitlan = %Station{name: "Pantitlan", coords: {0.123, 90.123}}
  # hangares = %Station{name: "Pantitlan", coords: {0.123, 90.123}}
  # linea_5 = %Line{name: "Línea 5", stations: [pantitlan, hangares]}
  # alias CDMXChallenge.Station


  #defmodule Foo do
  #  def get_coords(s = %{})
  #end

  @doc """

  ## Examples
    iex> CDMXChallenge.metro_lines
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



  # Firts Part
  # PER STATION
  def mine_information_every_station(item) do
    %{
       name: List.to_string(item.name) |> String.downcase() |> String.normalize(:nfd) |> String.replace(~r/[^a-z\s]/u, ""),
       line: List.to_string(item.line) |> String.split(".") |> Enum.at(0) |> String.split(" ") |> Enum.at(1),
       coords: "#{item.coords}"  |>  String.replace(~r"[a-z /]", "") |> String.replace("\n", "")
    }
   end

  def get_all_information_every_station(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[2]/Placemark"l,
      name: ~x"./name/text()",
      line: ~x"./description/text()",
      coords: ~x"./Point/coordinates/text()"
      )
    |> Enum.map(fn item -> CDMXChallenge.mine_information_every_station(item) end)

  end


  # PER LINE
  def mine_information_every_line(item) do
    %{
       line: List.to_string(item.line) |> String.split(" ") |> Enum.at(1),
       coords: "#{item.coords}" |> String.split("\n") |> Enum.map(fn coord -> String.replace(coord, ~r"[a-z /]", "") end ) |> Enum.filter(fn x -> x != "" end)
    }
   end


  def get_all_information_every_line(xml) do
    xml
    |> xpath(
      ~x"//Document/Folder[1]/Placemark"l,
      line: ~x"./name/text()",
      coords: ~x"./LineString/coordinates/text()"
      )
    |> Enum.map(fn item -> mine_information_every_line(item) end)
  end


  def get_stations_name(xml) do
    xml
    |> xpath(~x"//Document/Folder[1]/Placemark/name/text()"l)
    |> Enum.map(fn l ->
      List.to_string(l) |> String.split(" ") |> Enum.at(1)
     end)
  end

  def metro_lines(xml_path) do


    xml = File.read!(xml_path)
    stations_name = get_stations_name(xml)
    every_station = CDMXChallenge.get_all_information_every_station(xml)

    stations = Enum.map(stations_name, fn number2 ->
      res = Enum.filter(every_station, fn item ->
        item.line == number2
       end)
      Enum.map(res, fn item ->
        Map.delete(item, :line)
      end)
    end)

    Enum.map(0..(Enum.count(stations_name) - 1), fn idx ->
      %{
        name: Enum.at(stations_name, idx),
        stations: Enum.at(stations, idx)
      }
    end)
  end


  # List.to_string

  def metro_graph() do #xml_path
    #lines = CDMXChallenge.metro_lines(xml_path)
    # Create graph ...
    g = Graph.new(type: :undirected)
    g
    |> Graph.add_edge("pantitlan", "hangares")
    |> Graph.add_edge("hangares", "puerto areo")
    |> Graph.add_edge("puerto areo", "oceania")

  end


end





