# FIXED Process Ring

```elixir
iex> c "lib/otp/fixed_process_ring/fixed_process_ring.ex"
[ProcessRing]

iex> ring = ProcessRing.init(5)                 
pid: #PID<0.447.0>, next: #PID<0.448.0> main: true
pid: #PID<0.448.0>, next: #PID<0.449.0> main: false
pid: #PID<0.449.0>, next: #PID<0.450.0> main: false
pid: #PID<0.450.0>, next: #PID<0.451.0> main: false
pid: #PID<0.451.0>, next: #PID<0.447.0> main: false
#PID<0.447.0>

iex> ProcessRing.rounds(ring, "mi mensaje", 3)  
Process #PID<0.448.0> received message "mi mensaje", round 1
{:continue, "mi mensaje", 1, 3}
Process #PID<0.449.0> received message "mi mensaje", round 1
Process #PID<0.450.0> received message "mi mensaje", round 1
Process #PID<0.451.0> received message "mi mensaje", round 1
Process #PID<0.447.0> received message "mi mensaje", round 1
Process #PID<0.448.0> received message "mi mensaje", round 2
Process #PID<0.449.0> received message "mi mensaje", round 2
Process #PID<0.450.0> received message "mi mensaje", round 2
Process #PID<0.451.0> received message "mi mensaje", round 2
Process #PID<0.447.0> received message "mi mensaje", round 2
Process #PID<0.448.0> received message "mi mensaje", round 3
Process #PID<0.449.0> received message "mi mensaje", round 3
Process #PID<0.450.0> received message "mi mensaje", round 3
Process #PID<0.451.0> received message "mi mensaje", round 3
Process #PID<0.447.0> received message "mi mensaje", round 3
```
