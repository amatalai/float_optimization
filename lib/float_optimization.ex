defmodule FloatOptimization do
  def ceil(float), do: :erlang.ceil(float) |> :erlang.float()
  def floor(float), do: :erlang.floor(float) |> :erlang.float()
end
