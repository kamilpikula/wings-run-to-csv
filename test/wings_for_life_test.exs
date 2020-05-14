defmodule WingsForLifeTest do
  use ExUnit.Case
  doctest WingsForLife

  test "greets the world" do
    assert WingsForLife.hello() == :world
  end
end
