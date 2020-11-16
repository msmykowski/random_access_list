defmodule CompleteBinaryTree.Leaf do
  defstruct [:value]

  def new(value) do
    struct(__MODULE__, value: value)
  end
end
