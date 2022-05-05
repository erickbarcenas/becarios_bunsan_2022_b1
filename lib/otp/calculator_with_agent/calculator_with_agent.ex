defmodule Calculator do
  def init() do
    {:ok, pid} = Agent.start_link(fn -> %{result: 0} end)
    pid
  end

  def sum(pid, value), do: calc({:sum, value, pid})
  def sub(pid, value), do: calc({:sub, value, pid})
  def mult(pid, value), do: calc({:mult, value, pid})
  def div(pid, value), do: calc({:div, value, pid})

  def state(pid), do: calc({:state, pid})

  defp calc(params) do
    case params do
      {:sum, value, pid} ->
        Agent.update(pid, fn state -> %{state | result: state.result + value} end)

      {:sub, value, pid} ->
        Agent.update(pid, fn state -> %{state | result: state.result - value} end)

      {:mult, value, pid} ->
        Agent.update(pid, fn state -> %{state | result: state.result * value} end)

      {:div, value, pid} ->
        Agent.update(pid, fn state -> %{state | result: state.result / value} end)

      {:state, pid} ->
        Agent.get(pid, fn state -> state end)

      _ ->
        IO.puts("Invalid request")
    end
  end
end
