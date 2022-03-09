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

  # def metro_graph(xml_path) do
  #  lines = CDMXChallenge.metro_lines(xml_path)
  #  # Create graph ...
  # end


end

    # WORKS <----
    # Enum.zip([base, result])
    # |> Enum.into(%{})
