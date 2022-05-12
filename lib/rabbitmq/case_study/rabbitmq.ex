defmodule RabbitMQ.System do
  use AMQP

  @doc """
  Creates the exchaange, the queues and their bindings.
  If the exchange and queues already exist, does nothing.
  """
  def setup(exchange_name, queue_names) do
    connection = Connection.open() |> elem(2)
    channel_a = Channel.open(connection) |> elem(2)
    
    Exchange.declare(channel_a, exchange_name)

     
    Enum.map(queue_names, fn queue -> 
      n_queue = AMQP.Queue.declare(channel_a, queue)
      |> elem(2)
      |> Map.get(:queue)
      
      Queue.bind(channel_a, exchange_name, n_queue)
    end)
    
  end
end

defmodule RabbitMQ.Producer do
  @doc """
  Sends n messages with payload 'msg' and the given routing key.
  """
  def send(exchange, routing_key, msg, n) do
    
  end
end

defmodule RabbitMQ.Consumer do
  @doc """
  Creates a process that listens for messages on the given queue.
  When a message arrives, it writes to the log the pid, queue_name and msg.
  Example:
    iex> {:ok, pid} = Consumer.start("orders")
  """
  def start(queue_name) do
    
  end

  @doc """
  Stops the given consumer.
  Example:
    iex> Consumer.stop("orders")
  """
  def stop(pid) do
    
  end
end
