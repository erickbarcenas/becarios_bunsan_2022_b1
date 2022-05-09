defmodule FixProcessRing do
  def init(n) do
    pids = Enum.map(1..n, fn _ -> spawn(&wait_for_config/0) end)
    next_pids = Enum.drop(pids, 1) ++ [hd(pids)]
    ring_config = Enum.zip(pids, next_pids)

    ring_config
    |> hd()
    |> then(fn {pid, next} -> send(pid, {:config, next, true}) end)

    ring_config
    |> Enum.drop(1)
    |> Enum.each(fn {pid, next_pid} ->
      send(pid, {:config, next_pid, false})
    end)

    hd(pids)
  end

  def rounds(ring, msg, n) when n > 0 do
    send(ring, {:continue, msg, 1, n})
  end

  def wait_for_config() do
    receive do
      {:config, next_pid, main} ->
        IO.puts("pid: #{inspect(self())}, next: #{inspect(next_pid)} main: #{main}")
        process_msg(next_pid, main)

      _ ->
        :ok
    end
  end

  defp next_message(curr_round, goal_rounds, type) do
    case {type, curr_round <= goal_rounds} do
      {true, false} -> :stop
      {true, true} -> curr_round + 1
      _ -> curr_round
    end
  end

  def process_msg(next, main) do
    receive do
      {:continue, msg, current_round, goal} ->
        if current_round > 1 do
          new_current_round = current_round - 1

          IO.puts(
            "Process #{inspect(self())} received message \"#{msg}\", round #{new_current_round}"
          )

          case next_message(current_round, goal, main) do
            :stop -> :stop
            n when is_number(n) -> send(next, {:continue, msg, n, goal})
          end
        else
          case next_message(current_round, goal, main) do
            :stop -> :stop
            n when is_number(n) -> send(next, {:continue, msg, n, goal})
          end
        end

      _ ->
        :ok
    end

    process_msg(next, main)
  end
end
