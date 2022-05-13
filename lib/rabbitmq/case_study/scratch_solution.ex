{:ok, connection} = AMQP.Connection.open()
{:ok, channel_a} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel_a, "orders")

AMQP.Queue.declare(channel_a, "payments")

AMQP.Basic.publish(channel_a, "", "orders", "#{}")
IO.puts(" [x] Sent 'orders'")

AMQP.Basic.publish(channel_a, "", "payments", "#{}")
IO.puts(" [x] Sent 'payments'")

AMQP.Connection.close(connection)
