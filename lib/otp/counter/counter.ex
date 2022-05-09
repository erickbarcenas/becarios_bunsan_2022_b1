defmodule Counter do
  use Agent

  def start(init_val) do
    Agent.start(fn -> init_val end)
  end

  # def value(pid) do
  # end

  def inc(pid) do
    Agent.update(pid, &(&1 + 1))
  end
end
