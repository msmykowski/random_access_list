defmodule CompleteBinaryTreeTest do
  use ExUnit.Case
  doctest CompleteBinaryTree

  describe "#new/1" do
    test "#new/1 with one item" do
      assert CompleteBinaryTree.new([0])
    end

    test "#new/1 with many items" do
      list = Enum.into(0..14, [])
      assert CompleteBinaryTree.new(list)
    end
  end

  test "#fetch/2" do
    range = 0..14
    list = Enum.into(0..14, [])
    tree = CompleteBinaryTree.new(list)

    for i <- range do
      assert CompleteBinaryTree.fetch(tree, i) == {:ok, i}
    end
  end

  test "#update_at/3" do
    range = 0..14
    list = Enum.into(0..14, [])
    tree = CompleteBinaryTree.new(list)

    for i <- range do
      assert tree
             |> CompleteBinaryTree.update_at(i + 1, i)
             |> CompleteBinaryTree.fetch(i) == {:ok, i + 1}
    end
  end
end
