defmodule RandomAccessList do
  @moduledoc """
  Documentation for `RandomAccessList`.
  """

  defstruct list: []

  def new(list, acc \\ [])

  def new([], acc), do: struct(__MODULE__, list: Enum.reverse(acc))

  def new(list, acc) when is_list(list) do
    size =
      list
      |> length()
      |> greedy_skew_binary_decomposition()

    {head, tail} = Enum.split(list, size)

    new(tail, [CompleteBinaryTree.new(head) | acc])
  end

  def fetch(%__MODULE__{list: list}, index), do: fetch_(list, index)

  defp fetch_([], _index), do: :error

  defp fetch_([head | tail], index) do
    if index < CompleteBinaryTree.size(head) do
      CompleteBinaryTree.fetch(head, index)
    else
      fetch_(tail, index - CompleteBinaryTree.size(head))
    end
  end

  def update_at(%__MODULE__{list: list}, index, update_func) do
    %__MODULE__{list: update_at_(list, [], index, update_func)}
  end

  defp update_at_([], acc, _index, _update_func), do: Enum.reverse(acc)

  defp update_at_([head | tail], acc, index, update_func) do
    if index < CompleteBinaryTree.size(head) do
      updated_tree = CompleteBinaryTree.update_at(head, index, update_func)
      Enum.reverse([updated_tree | acc]) ++ tail
    else
      update_at_(tail, [head | acc], index - CompleteBinaryTree.size(head), update_func)
    end
  end

  defp greedy_skew_binary_decomposition(number) do
    trunc(:math.pow(2, :math.floor(:math.log(number + 1) / :math.log(2))) - 1)
  end
end
