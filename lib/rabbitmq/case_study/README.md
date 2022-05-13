# RabbitMQ (system integration tool)

Software where queues can be defined, applications can connect to said queues and put/read messages on them ().


It is requested to implement the following architecture:

![Architecture](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/rabbitmq/case_study/imgs/ecommerce.png)

Settings

```
Username: admin
Password: Secr3t
```
The dashboard can be installed following the following tutorial:
https://citizix.com/how-to-install-rabbitmq-in-ubuntu-20-04/


## Initial state
Dashboard data is shown below:

Connections

![Dashboard](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/rabbitmq/case_study/imgs/initial_state/connections.jpeg)

Channels

![Dashboard](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/rabbitmq/case_study/imgs/initial_state/connections.jpeg)

Exchanges

![Dashboard](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/rabbitmq/case_study/imgs/initial_state/exchanges.jpeg)

Queues

![Dashboard](https://github.com/erickbarcenas/becarios_bunsan_2022_b1/blob/main/lib/rabbitmq/case_study/imgs/initial_state/queues.jpeg)


## Final state

1.  Creates the exchange, the queues and their bindings.

```elixir

iex> RabbitMQ.System.setup("rabbitmq_project", ["payments", "orders"])
10:12:11.277 [info]  Exchange 'rabbitmq_project'' has been associated with the following queues:
 
10:12:11.277 [info]  payments

10:12:11.277 [info]  orders
:ok
```

2. The producer is created

```elixir
iex> RabbitMQ.Producer.send("rabbitmq_project", "payments", "{order_id: 1, amount: 100}", 5)
10:42:32.178 [info]  Message was sent: '{order_id: 1, amount: 100}' to routing: payments
:ok
```

```elixir
iex> RabbitMQ.Producer.send("rabbitmq_project", "orders", "{order_id: 1, items: [{3, 1}, {2, 2}]}", 5)
10:44:51.087 [info]  Message was sent: '{order_id: 1, items: [{3, 1}, {2, 2}]}' to routing: orders
:ok
```


3. The consumer is created

```elixir
iex> payments_1 = RabbitMQ.Consumer.start("payments")

```

```elixir
iex> orders_1 = RabbitMQ.Consumer.start("orders")

```

4. Stopping queues

```elixir
iex> RabbitMQ.Consumer.stop(payments_1)

iex> RabbitMQ.Consumer.stop(orders_1)
```

## Another Examples
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

