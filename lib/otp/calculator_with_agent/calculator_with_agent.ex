defmodule CalculatorAgent do
  def init() do
    {:ok, pid} = Agent.start_link(fn -> 0 end)
    pid
  end

  def sum(pid, value), do: Agent.update(pid, fn state -> state + value end)
  def sub(pid, value), do: Agent.update(pid, fn state -> state - value end)
  def mult(pid, value), do: Agent.update(pid, fn state -> state * value end)
  def div(pid, value) when value > 0 do 
    Agent.update(pid, fn state -> state / value end)
  end

  def state(pid), do: Agent.get(pid, & &1)

end
