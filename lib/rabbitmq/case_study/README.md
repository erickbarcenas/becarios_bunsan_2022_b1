# Case Study

1. Se crea la conexión
```elixir
iex(1)> {:ok, connection} = AMQP.Connection.open()
{:ok, %AMQP.Connection{pid: #PID<0.351.0>}}
```

2. Se crea el canal `channel_a`
```elixir
iex(2)> {:ok, channel_a} = AMQP.Channel.open(connection)
{:ok,
 %AMQP.Channel{
   conn: %AMQP.Connection{pid: #PID<0.351.0>},
   custom_consumer: {AMQP.SelectiveConsumer, #PID<0.347.0>},
   pid: #PID<0.361.0>
 }}
```

3. Se crea el exchange con nombre `rabbitmq_project`
```elixir
AMQP.Exchange.declare(channel_a, "rabbitmq_project")
```

4. Se crean las dos colas: `orders` y `payments`
```elixir
iex(3)> AMQP.Queue.declare(channel_a, "orders")
{:ok, %{consumer_count: 0, message_count: 1, queue: "orders"}}
iex(4)> AMQP.Queue.declare(channel_a, "payments")
{:ok, %{consumer_count: 0, message_count: 1, queue: "payments"}}
```


5. Se une el exchange con la cola (según el respectivo canal)
```elixir
iex> AMQP.Queue.bind(channel_a, "orders", "rabbitmq_project")

iex> AMQP.Queue.bind(channel_a, "payments", "rabbitmq_project")
```


6. Producer - Se hace una prueba para enviar mensajes 
```elixir
iex> AMQP.Basic.publish(channel_a, "rabbitmq_project", "", "1") # orders

iex> AMQP.Basic.publish(channel_a, "rabbitmq_project", "", "100") # payments
```

6. Consumer - Se hace una prueba para consumir
```elixir
iex> AMQP.Queue.consume(channel_a, "rabbitmq_project", nil, no_ack: true)

```

