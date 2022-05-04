# Process Ring

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
