defmodule RabbitMQ.Consumer do
  use AMQP

  @doc """
  Creates a process that listens for messages on the given queue.
  When a message arrives, it writes to the log the pid, queue_name and msg.
  Example:
    iex> {:ok, pid} = Consumer.start("orders")
  """
  def start(queue_name) do
    connection = Connection.open() |> elem(1)
    channel = Channel.open(connection) |> elem(1)
    spawn(fn -> listen_messages(queue_name, connection, channel) end)
  end

  defp listen_messages(queue_name, connection, channel) do
    Basic.consume(channel, queue_name, nil, no_ack: true)

    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts("#{inspect(self())} - #{queue_name} receives: #{payload}")
        listen_messages(queue_name, connection, channel)

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
