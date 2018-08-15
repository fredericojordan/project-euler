#!/usr/bin/env elixir
defmodule Problem024 do
  @moduledoc """
  A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

      012   021   102   120   201   210

  What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
  """

  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 1, do: x*factorial(x-1)

  defp divider(list) do
    list
    |> Enum.count()
    |> Kernel.-(1)
    |> factorial
  end

  defp permutate([head], _, acc), do: [head | acc] |> Enum.reverse() |> Integer.undigits()
  defp permutate(list, index, acc) do
    { i, tail } =
      list
      |> List.pop_at(div(index, divider(list)))
    permutate(tail, rem(index, divider(list)), [ i | acc ])
  end
  defp permutate(list, index), do: permutate(list, index-1, [])

  def solve do
    permutate([0,1,2,3,4,5,6,7,8,9], 1_000_000)
  end
end

IO.puts Problem024.solve
