defmodule CompleteBinaryTree.Node do
  defstruct [:left, :right, :size, :value]

  def new(value, left, right, size) do
    struct(__MODULE__, value: value, left: left, right: right, size: size)
  end
end
