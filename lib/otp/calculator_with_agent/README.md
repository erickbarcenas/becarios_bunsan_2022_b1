# Calculator with Agent


## Demo
```elixir
iex> c"lib/otp/calculator_with_agent/calculator_with_agent.ex"
[Calculator]
iex> pid = Calculator.init() 
#PID<0.129.0>
iex> Calculator.sum(pid, 1)  
:ok
iex> Calculator.mult(pid, 10)
:ok
iex> Calculator.sub(pid, 1)  
:ok
iex> Calculator.div(pid, 2)  
:ok
iex> Calculator.state(pid)   
%{result: 4.5}
```

## Basic example to create an Agent

```elixir
iex> {:ok, pid} = Agent.start_link(fn -> %{result: 0} end)
{:ok, #PID<0.108.0>}
```

```elixir
iex> Agent.get(pid, fn state -> state.result end)
0
```

```elixir
iex> Agent.update(pid, fn state -> %{state | result: state.result + 1} end)
:ok
```

```elixir
iex> Agent.get(pid, fn state -> state end)
%{result: 1}
```

