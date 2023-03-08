defmodule ExWacaTest do
  use ExUnit.Case
  doctest ExWaca

  test "greets the world" do
    assert ExWaca.hello() == :world
  end
end
