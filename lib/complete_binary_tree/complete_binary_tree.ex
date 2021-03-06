defmodule CompleteBinaryTree do
  alias CompleteBinaryTree.{Leaf, Node}

  def new(list) do
    new(list, length(list))
  end

  defp new([head], _size) do
    Leaf.new(head)
  end

  defp new([head | tail], size) do
    if skew_binary_number?(size) do
      subtree_size = div(length(tail), 2)
      {left_subtree, right_subtree} = Enum.split(tail, subtree_size)

      Node.new(head, new(left_subtree, subtree_size), new(right_subtree, subtree_size), size)
    else
      raise("List must be of a skew binary length")
    end
  end

  def fetch(node, index) do
    case {node, index} do
      {%{value: value}, 0} ->
        {:ok, value}

      {%Node{size: size, left: left}, index} when index <= size / 2 ->
        fetch(left, index - 1)

      {%Node{size: size, right: right}, index} when index > size / 2 ->
        fetch(right, index - 1 - div(size - 1, 2))

      _ ->
        :error
    end
  end

  def update_at(node, index, update_func) do
    case {node, index} do
      {%Leaf{value: value}, 0} ->
        Leaf.new(update_func.(value))

      {%Node{value: value} = node, 0} ->
        Node.new(update_func.(value), node.left, node.right, node.size)

      {%Node{size: size} = node, index} when index <= size / 2 ->
        Node.new(node.value, update_at(node.left, index - 1, update_func), node.right, node.size)

      {%Node{size: size} = node, index} when index > size / 2 ->
        Node.new(
          node.value,
          node.left,
          update_at(node.right, index - 1 - div(size - 1, 2), update_func),
          node.size
        )

      _ ->
        raise("Index not found")
    end
  end

  def size(%Leaf{}), do: 1

  def size(%Node{size: size}), do: size

  defp skew_binary_number?(size) do
    :math.pow(2, :math.floor(:math.log(size + 1) / :math.log(2))) == size + 1
  end
end
