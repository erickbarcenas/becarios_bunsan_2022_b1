# Process Ring

Definimos el número de procesos


```elixir
iex> c "lib/otp/process_ring/process_ring.ex"   
```

c "lib/otp/process_ring/process_ring_v2.ex"   



```elixir
iex> ring = ProcessRing.init(5)               
[#PID<0.196.0>, #PID<0.197.0>, #PID<0.198.0>, #PID<0.199.0>, #PID<0.200.0>]
```

Definimos el número de vueltas
```elixir
iex(18)> ProcessRing.rounds(ring, "mi mensaje", 3)
Process #PID<0.196.0> received message mi mensaje, round 1
Process #PID<0.197.0> received message mi mensaje, round 1
Process #PID<0.198.0> received message mi mensaje, round 1
Process #PID<0.199.0> received message mi mensaje, round 1
Process #PID<0.200.0> received message mi mensaje, round 1
Process #PID<0.196.0> received message mi mensaje, round 2
Process #PID<0.197.0> received message mi mensaje, round 2
Process #PID<0.198.0> received message mi mensaje, round 2
Process #PID<0.199.0> received message mi mensaje, round 2
Process #PID<0.200.0> received message mi mensaje, round 2
Process #PID<0.196.0> received message mi mensaje, round 3
Process #PID<0.197.0> received message mi mensaje, round 3
Process #PID<0.198.0> received message mi mensaje, round 3
Process #PID<0.199.0> received message mi mensaje, round 3
Process #PID<0.200.0> received message mi mensaje, round 3
:ok
```


Para conectarse a un proceso se ocupa link
```elixir
Process.link(pid)
```


## The pong function takes the pid of the ping process.
send(B, msg)


    receive do
      {sender_pid, value} ->
        # code
        # _-> 
        # unmatched messages are kept in the mailbox
        # IO.puts "don't know how to process this message"
    end



ring |> ProcessRing.link_processes()

p1 = Enum.at(ring, 1)


send(p1, {:pass_it_on, "message", 1, 5})

p2 = Enum.at(ring, 2)
send(p2, {:pass_it_on, "message", 2, 5})
-------------
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:6:6] [ds:6:6:10] [async-threads:1] [jit]

Interactive Elixir (1.13.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
nil
iex(2)>  c "lib/otp/process_ring/process_ring_v2.ex" 
warning: variable "loop" does not exist and is being expanded to "loop()", please use parentheses to remove the ambiguity or change the variable name
  lib/otp/process_ring/process_ring_v2.ex:12: ProcessRing.init/1

warning: redefining @doc attribute previously set at line 25.

Please remove the duplicate docs. If instead you want to override a previously defined @doc, attach the @doc attribute to a function head (the function signature not followed by any do-block). For example:

    @doc """
    new docs
    """
    def link_processes(...)

  lib/otp/process_ring/process_ring_v2.ex:33: ProcessRing.link_processes/2

warning: variable "loop" is unused (if the variable is not meant to be used, prefix it with an underscore)
  lib/otp/process_ring/process_ring_v2.ex:46: ProcessRing.loop/0

warning: module attribute @name was set but never used
  lib/otp/process_ring/process_ring_v2.ex:6

[ProcessRing]
iex(3)> 
nil
iex(4)> ring = ProcessRing.init(5)
[#PID<0.117.0>, #PID<0.118.0>, #PID<0.119.0>, #PID<0.120.0>, #PID<0.121.0>]
iex(5)> 
nil
iex(6)> ring |> ProcessRing.link_processes()
:ok
iex(7)> 
03:50:42.050 [error] Process #PID<0.121.0> raised an exception
** (ErlangError) Erlang error: :noproc
    :erlang.link(#PID<0.117.0>)
    lib/otp/process_ring/process_ring_v2.ex:45: ProcessRing.loop/0
 
nil
iex(8)> r ProcessRing
warning: redefining module ProcessRing (current version defined in memory)
  lib/otp/process_ring/process_ring_v2.ex:1

warning: variable "loop" does not exist and is being expanded to "loop()", please use parentheses to remove the ambiguity or change the variable name
  lib/otp/process_ring/process_ring_v2.ex:12: ProcessRing.init/1

warning: redefining @doc attribute previously set at line 25.

Please remove the duplicate docs. If instead you want to override a previously defined @doc, attach the @doc attribute to a function head (the function signature not followed by any do-block). For example:

    @doc """
    new docs
    """
    def link_processes(...)

  lib/otp/process_ring/process_ring_v2.ex:33: ProcessRing.link_processes/2

warning: variable "loop" does not exist and is being expanded to "loop()", please use parentheses to remove the ambiguity or change the variable name
  lib/otp/process_ring/process_ring_v2.ex:46: ProcessRing.loop/0

warning: module attribute @name was set but never used
  lib/otp/process_ring/process_ring_v2.ex:6

{:reloaded, [ProcessRing]}
iex(9)> ring |> ProcessRing.link_processes()
:ok
iex(10)> p1 = Enum.at(ring, 1)
#PID<0.118.0>
iex(11)> p2 = Enum.at(ring, 2)
#PID<0.119.0>
iex(12)> process(p1, "message", p2)             
** (CompileError) iex:12: undefined function process/3 (there is no such import)

iex(12)> ProcessRing.process(p1, "message", p2) 

BREAK: (a)bort (A)bort with dump (c)ontinue (p)roc info (i)nfo
       (l)oaded (v)ersion (k)ill (D)b-tables (d)istribution
