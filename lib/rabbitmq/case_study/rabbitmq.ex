defmodule RabbitMQ.System do
  require Logger
  use AMQP

  @doc """
  Creates the exchange, the queues and their bindings.
  If the exchange and queues already exist, does nothing.
  """
  def setup(exchange_name, queue_names) do
    connection = Connection.open() |> elem(1)
    channel = Channel.open(connection) |> elem(1)
    Exchange.declare(channel, exchange_name)
    Enum.each(queue_names, fn queue ->
      Queue.declare(channel, queue)
      Queue.bind(channel, queue, exchange_name, routing_key: queue)
    end)
    Logger.info("Exchange '#{exchange_name}' has been associated with the following queues:")
    queue_names |> Enum.each(&Logger.info(&1))
    Connection.close(connection)
  end
end

defmodule RabbitMQ.Producer do
  require Logger
  use AMQP

  @doc """
  Sends n messages with payload 'msg' and the given routing key.
  """
  def send(exchange, routing_key, msg, n) do
    connection = Connection.open() |> elem(1)
    channel = Channel.open(connection) |> elem(1)
    Enum.each(1..n, fn _ ->
      Basic.publish(channel, exchange, routing_key, msg)
    end)
    Logger.info("Message was sent: '#{msg}'' to routing: #{routing_key}")
    Connection.close(connection)
  end
end

defmodule RabbitMQ.Consumer do
  use AMQP
  @doc """
  Creates a process that listens for messages on the given queue.
  When a message arrives, it writes to the log the pid, queue_name and msg.
  Example:
    iex> {:ok, pid} = Consumer.start("orders")
  """
  def start(queue_name) do
    spawn(fn -> listen_messages(queue_name) end)
  end

  defp listen_messages(queue_name) do
    connection = Connection.open() |> elem(1)
    channel = Channel.open(connection) |> elem(1)
    Basic.consume(channel, queue_name, nil, no_ack: true)

    receive do
      {:deliver} ->
        Connection.close(connection)
        listen_messages(queue_name)

      {:stop} ->
        Connection.close(connection)
        :ok
    end
  end

  @doc """
  Stops the given consumer.
  Example:
    iex> Consumer.stop("orders")
  """
  def stop(pid) do
    send(pid, {:stop})
  end
end
