data =
  if File.exists?("data") do
    "data" |> File.read!() |> :erlang.binary_to_term()
  else
    floats = StreamData.float() |> Enum.take(1000)
    binary = :erlang.term_to_binary(floats)
    File.write!("data", binary)

    floats
  end

Benchee.run(
  %{
    "ceil/1" => fn -> Enum.each(data, &Float.ceil/1) end,
    "ceil/2 precision 0" => fn -> Enum.each(data, &Float.ceil(&1, 0)) end,
    "ceil/2 precision 1" => fn -> Enum.each(data, &Float.ceil(&1, 1)) end
  },
  memory_time: 2,
  unit_scaling: :none
)

Benchee.run(
  %{
    "floor/1" => fn -> Enum.each(data, &Float.floor/1) end,
    "floor/2 precision 0" => fn -> Enum.each(data, &Float.floor(&1, 0)) end,
    "floor/2 prevision 1" => fn -> Enum.each(data, &Float.floor(&1, 1)) end
  },
  memory_time: 2,
  unit_scaling: :none
)
