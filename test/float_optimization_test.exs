defmodule FloatOptimizationTest do
  use ExUnit.Case
  use ExUnitProperties

  property "ceil correctness" do
    check all float <- StreamData.float() do
      assert Float.ceil(float) === FloatOptimization.ceil(float)
    end
  end

  property "floor correctness" do
    check all float <- StreamData.float() do
      assert Float.ceil(float) === FloatOptimization.ceil(float)
    end
  end

  property "round correctness" do
    check all float <- StreamData.float() do
      assert Float.round(float) === FloatOptimization.round(float)
    end
  end
end
