defmodule FloatOptimization do
  def ceil(float), do: :math.ceil(float)
  def floor(float), do: :math.floor(float)
  def round(float), do: float |> :erlang.round() |> :erlang.float()
end
