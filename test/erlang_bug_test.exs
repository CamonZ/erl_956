defmodule ErlangBugTest do
  use ExUnit.Case
  doctest ErlangBug

  test "greets the world" do
    assert ErlangBug.hello() == :world
  end
end
