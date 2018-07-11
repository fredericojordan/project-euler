#!/usr/bin/env elixir
defmodule Problem049 do
  @moduledoc """
  The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways:
  (i) each of the three terms are prime, and,
  (ii) each of the 4-digit numbers are permutations of one another.

  There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property,
  but there is one other 4-digit increasing sequence.

  What 12-digit number do you form by concatenating the three terms in this sequence?
  """

  defp prime?(1), do: false
  defp prime?(2), do: true
  defp prime?(x) when is_integer(x) and x > 2, do: Enum.all?((2..round(:math.sqrt(x))), &(rem(x, &1) != 0))

  def permutate([]), do: [[]]
  def permutate(list) do
    for x <- list,
        y <- permutate(list -- [x]),
        do:
          [x|y]
  end

  defp prime_permutations(num) do
    permutate(Integer.digits(num))
    |> Stream.map(&Integer.undigits/1)
    |> Stream.filter(&(&1 > 999))
    |> Stream.filter(&prime?/1)
    |> Enum.to_list()
    |> Enum.uniq()
    |> Enum.sort()
  end

  def solve do
    1_000..9_999
    |> Stream.filter(&prime?/1)
    |> Stream.map(&prime_permutations/1)
    |> Stream.filter(&(Enum.count(&1) > 2))
    |> Enum.uniq()
    |> Enum.to_list()
    |> IO.inspect()
    |> Enum.count()
  end
end

IO.puts Problem049.solve
