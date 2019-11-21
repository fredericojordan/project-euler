#!/usr/bin/env elixir
defmodule Problem062 do
  @moduledoc """
  The cube, 41063625 (345³), can be permuted to produce two other cubes: 56623104 (384³) and 66430125 (405³). In fact,
  41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.

  Find the smallest cube for which exactly five permutations of its digits are cube.
  """

  defp order_letters(number) do
    number
    |> Integer.digits()
    |> Enum.sort()
  end

  defp check_permutation_count(x, map) when x < 5, do: {:cont, map}
  defp check_permutation_count(_x, map), do: {:halt, map}

  defp less_than_five_permutations(x, acc) do
    key = order_letters(x)
    new_map = Map.update(acc, key, [x], &(&1 ++ [x]))

    max_permutation_count =
      new_map
      |> Map.values()
      |> Enum.map(&Enum.count/1)
      |> Enum.max()

    check_permutation_count(max_permutation_count, new_map)
  end

  def solve do
    Stream.iterate(215, &(&1+1))
    |> Stream.map(&(&1*&1*&1))
    |> Enum.reduce_while(%{}, &less_than_five_permutations/2)
    |> Enum.max_by(fn x -> Enum.count(elem(x, 1)) end)
    |> elem(1)
    |> Enum.sort()
    |> List.first()
  end
end

IO.puts Problem062.solve
