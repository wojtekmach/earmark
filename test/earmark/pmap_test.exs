defmodule Earmark.PmapTest do
  use ExUnit.Case

  alias Earmark.Error, as: E

  import Earmark, only: [pmap: 2, pmap: 3]
  

  
  describe "without timeout" do
    test "just works" do
      assert pmap(1..2, &(&1+1)) == [2, 3]
    end
    test "even with manual timeout" do
      assert pmap(1..2, &(&1+1), 2_000) == [2, 3]
    end
  end

  describe "with timeout" do
    test "one element" do
      assert_raise(E, fn ->
        pmap(1..1, fn _ -> :timer.sleep(10) end, 5)
      end)
    end

    test "any element" do 
      assert_raise(E, fn ->
        pmap([10, 20, 10], fn x -> :timer.sleep(x) end, 15)
      end)
    end
  end
end
