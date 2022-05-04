# Calculator


```elixir
iex> c "lib/otp/calculator/calculator.ex"         
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


```elixir
iex> Process.info(pid)
[
  current_function: {Calculator, :calc, 1},
  initial_call: {Calculator, :init, 0},
  status: :waiting,
  message_queue_len: 0,
  links: [],
  dictionary: [],
  trap_exit: false,
  error_handler: :error_handler,
  priority: :normal,
  group_leader: #PID<0.66.0>,
  total_heap_size: 233,
  heap_size: 233,
  stack_size: 3,
  reductions: 71,
  garbage_collection: [
    max_heap_size: %{error_logger: true, kill: true, size: 0},
    min_bin_vheap_size: 46422,
    min_heap_size: 233,
    fullsweep_after: 65535,
    minor_gcs: 0
  ],
  suspending: []
]
```

```elixir
Process.alive?(pid)
```
## Remeber:
To get back responses from the shell session, you can use the built-in flush/0