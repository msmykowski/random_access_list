defmodule RandomAccessList do
  @moduledoc """
  Documentation for `RandomAccessList`.
  """

  def new(list, acc \\ [])

  def new([], acc), do: Enum.reverse(acc)

  def new(list, acc) when is_list(list) do
    size =
      list
      |> length()
      |> gsbd()

    {head, tail} = Enum.split(list, size)
    new(tail, [CompleteBinaryTree.new(head) | acc])
  end

  def fetch([], _index), do: {:error, :index_not_found}

  def fetch([head | tail], index) do
    if index < CompleteBinaryTree.size(head) do
      CompleteBinaryTree.fetch(head, index)
    else
      fetch(tail, index - head.size)
    end
  end

  defp gsbd(number) do
    trunc(:math.pow(2, :math.floor(:math.log(number + 1) / :math.log(2))) - 1)
  end
end