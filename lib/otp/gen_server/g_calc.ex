defmodule GCalc do
  use GenServer
  @name __MODULE__

  def start() do
    {:ok, pid} = GenServer.start_link(GCalc, [0])
    pid
  end

  def init(param) do
    {:ok, %{conteo: 0}}
  end

  def add(pid, x, y) when x > 0 and y > 0 do
    GenServer.call(pid, {:add, x, y})
    # IO.puts("hi!")
  end

  def state(pid) do
    GenServer.call(pid, :state)
  end

  def handle_call(params, _from, %{conteo: conteo}) do
    case params do
      {:add, n, m} -> 
        result = n + m
        {:reply, result, %{conteo: conteo + 1}}
      :state ->
        {:reply, conteo, %{conteo: conteo}}
    end
    
  end

  # def put(pid, key, value) do
  #   GenServer.call(pid, {:put, key, value})
  # end

  # def get(pid, key) do
  #   GenServer.call(pid, {:get, key})
  # end

  # def handle_call({:get, key}, from, state) do
  #   {Map.get(state, key), state}
  # end
end
