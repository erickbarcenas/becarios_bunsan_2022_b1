# Erlang Platform

- 1/3 is the language
- 1/3 is the BEAM
- 1/3 is OTP

## OTP (Open Telecom PLatform)
- Mechanisms to interop with other languages.
- Tools for debugging and deploying applications.
- A definen process to make deployments.

### OTP BEhaviors
    1. Process (send & receive)
    2. Task: process that executes only once
        * Asynchronous units
        * Similar to promises or futures
    3. Agent: a server that keeps some state
        
    4. Genserver
        * handle_call/3 must be used for synchronous request
        * handle_cast/2 must be used for asynchronous request,
          when you don't care about a reply. 
    5. Supervisor: process that creates and monitor other processes
        * Supervision tree
        * Strategies
            - :one_for_one
            - :one_for_all
            - :rest_for_one
            - :simple_one_for_one
        * Options
            - :max_restarts. The maximum amount of restarts allowed in time frame. Defaults to 3.
            - :max_seconds. The time frame in which :max\_restarts applies. Defaults to 5.
        * Applications
            - Application.started_application
    6. Aplication

## Agent Operations

## GenServer
- It's the most common behavior in OTP
- It's a process that 
    - Encapsulates state
    - Allows synchronous (call) and asynchronous (cast) operations
    - Allows hot-code realoading

![gen_server_call](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/otp/assets/gen_server_call.png)


## Supervisor

![supervisor](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/otp/assets/supervisor.png)






## The Soul of Erlang and Elixir • Saša Jurić • GOTO 2019

### process

It's a runtime execution contect of code.
Any code like elixir code runs in some process at runtime.


### spawn

![spawn](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/otp/assets/spawn.png)


### BEAM

![BEAM](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/otp/assets/BEAM.png)


### Process skeleton

![process_skeleton](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/otp/assets/process_skeleton.png)


## Introducción a Erlang y Elixir - Parte 2


## References
[The Soul of Erlang and Elixir • Saša Jurić • GOTO 2019](https://www.youtube.com/watch?v=JvBT4XBdoUE&t=2s&ab_channel=GOTOConferences)

[Introducción a Erlang y Elixir - Parte 2](https://www.youtube.com/watch?v=3FEUdbu_iuc&t=2558s&ab_channel=Agust%C3%ADnRamosFonseca)