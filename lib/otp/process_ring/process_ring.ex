defmodule ProcessRing do
  @moduledoc """
    Process that communicates with the following, e.g:
    A -> B; B -> C; C -> D; D -> A
  """
  @name __MODULE__

  @doc """
  Creates a list of spawned pids
  """
  def init(n) do
    if n > 1 do
      1..n |> Enum.map(fn _ -> spawn(fn -> loop end) end)
    else
      exit("Please enter a number greater than 1!")
    end
  end

  @doc """
  Entry point
  """
  def link_processes(procs) do
    link_processes(procs, [])
  end

  @doc """
  Function initializes the second argument to the empty list
  """
  def link_processes([proc_1, proc_2 | rest], linked_processes) do
    send(proc_1, {:link, proc_2})
    link_processes([proc_2 | rest], [proc_1 | linked_processes])
  end

  @doc """
  List of processes (initially unlinked)
  """
  def link_processes([proc | []], linked_processes) do
    first_process = linked_processes |> List.last()
    send(proc, {:link, first_process})
    :ok
  end

  def loop do
    receive do
      {:link, link_to} when is_pid(link_to) ->
        Process.link(link_to)
        loop

      {:continue, message, current_round, limit} ->
        IO.puts("Process #{inspect(self())} received message: #{message}, round #{round}")

        case pass_to_next_process(current_round, limit, type) do
          :noop ->
            :noop

          iteration when is_number(iteration) ->
            send(next, {:continue, message, n, limit})
        end

        loop(next, type)

      :trap_exit ->
        Process.flag(:trap_exit, true)
        loop

      :crash ->
        1 / 0

      {:EXIT, pid, reason} ->
        IO.puts("#{inspect(self)} received {:EXIT, #{inspect(pid)}, #{reason}}")
        loop
    end
  end

  def show_links(ring) do
    ring
    |> Enum.map(fn pid ->
      "#{inspect(pid)}: #{inspect(Process.info(pid, :links))}"
    end)
  end

  def kill_any_process(ring) do
    ring |> Enum.shuffle() |> List.first() |> send(:crash)
  end

  @doc """
  Use after kill_any_process
  """
  def rocesses_survived(ring) do
    ring |> Enum.map(fn pid -> Process.alive?(pid) end)
  end

  def rounds(ring, message, rounds_number) do
    # link all process
    ring_with_linked_processes = ring |> link_processes()
    send(ring_with_linked_processes, {:continue, message, 1, n})
  end

  def pass_to_next_process(current_round, limit_rounds, type) do
    case {type, current_round < limit_rounds} do
      {:last, false} -> :noop
      {:last, true} -> current_round + 1
      _ -> current_round
    end
  end
end
