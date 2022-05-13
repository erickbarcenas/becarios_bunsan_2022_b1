# iex> options = [host: "localhost", port: 5672, virtual_host: "/", username: "guest", password: "guest"]
# iex> AMQP.Connection.open(options)
# {:ok, %AMQP.Connection{}}
# 
# iex> AMQP.Connection.open("amqp://guest:guest@localhost")
# {:ok, %AMQP.Connection{}}

{:ok, connection} = AMQP.Connection.open()
{:ok, channel_a} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel_a, "hello")
AMQP.Basic.publish(channel_a, "", "hello", "Hello World!")
IO.puts(" [x] Sent 'Hello World!'")
AMQP.Connection.close(connection)
