iex> c "lib/otp/gen_server/g_calc.ex"

iex(1)> {:ok, pid} = KeyValueStore.start()
iex(2)> KeyValueStore.put(pid, :some_key, :some_value)
iex(3)> KeyValueStore.get(pid, :some_key)
:some_valu