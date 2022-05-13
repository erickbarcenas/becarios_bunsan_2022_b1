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
      
  
      Logger.info("By '#{routing_key}' (#{n} times) was sent: #{msg}")
      Connection.close(connection)
    end
  end