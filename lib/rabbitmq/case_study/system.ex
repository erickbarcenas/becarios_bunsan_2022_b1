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
  
      Exchange.declare(channel, exchange_name, :direct)
  
      Enum.each(queue_names, fn queue ->
        Queue.declare(channel, queue)
        Queue.bind(channel, queue, exchange_name, routing_key: queue)
      end)
  
      Logger.info("Exchange '#{exchange_name}' has been associated with the following queues:")
      queue_names |> Enum.each(&Logger.info(&1))
      Connection.close(connection)
    end
  end