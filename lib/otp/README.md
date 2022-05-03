# Calculator


```elixir
iex> c "lib/otp/calculator.ex"         
[Calculator]
iex> pid = spawn(Calculator, :init, [])
#PID<0.176.0>
iex> send(pid, {:state, self()})       
{:state, #PID<0.106.0>}
iex> flush()
0
:ok
iex> send(pid, {:sum, 1})
{:sum, 1}
iex> send(pid, {:sub, 1})
{:sub, 1}
iex> send(pid, {:sum, 10})
{:sum, 10}
iex> send(pid, {:mult, -1})
{:mult, -1}
iex> send(pid, {:div, 2})  
{:div, 2}
iex> send(pid, {:state, self()})
{:state, #PID<0.106.0>}
iex> flush()
-5.0
:ok
```