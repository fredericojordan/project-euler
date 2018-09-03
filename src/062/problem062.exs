#!/usr/bin/env elixir
defmodule Problem059 do
  @moduledoc """
  The cube, 41063625 (345³), can be permuted to produce two other cubes: 56623104 (384³) and 66430125 (405³). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.

  Find the smallest cube for which exactly five permutations of its digits are cube.
  """

  defp is_cube?(number) do
    root =
      number
      |> :math.pow(1/3)
      |> round()

    root*root*root == number
  end

  defp permutate(number) when is_integer(number) do
    number
    |> Integer.digits()
    |> permutate()
    |> Enum.map(&Integer.undigits/1)
  end

  defp permutate([]), do: [[]]

  defp permutate(list) do
    for x <- list,
        y <- permutate(list -- [x]),
        do:
          [x|y]
  end

  defp cube_permutations(number) do
    permutate(number)
    |> Enum.uniq()
    |> Enum.filter(&is_cube?/1)
    |> Enum.to_list()
  end

  def solve do
    Stream.iterate(344, &(&1+1))
    |> Stream.map(&(&1*&1*&1))
    |> Stream.map(&cube_permutations/1)
    |> Stream.filter(&(Enum.count(&1) == 5))
    |> Enum.take(1)
    |> List.first()
    |> Enum.min()
  end
end

IO.puts Problem059.solve
