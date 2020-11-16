defmodule RandomAccessListTest do
  use ExUnit.Case
  doctest RandomAccessList

  describe "#new/1" do
    test "#new/1 with one item" do
      assert RandomAccessList.new([0])
    end

    test "#new/1 with many items" do
      list = Enum.into(0..25, [])
      assert RandomAccessList.new(list)
    end
  end

  test "#fetch/2" do
    range = 0..25
    list = Enum.into(range, [])
    ral = IO.inspect RandomAccessList.new(list)

    for i <- range do
      assert RandomAccessList.fetch(ral, i) == {:ok, i}
    end
  end
end
