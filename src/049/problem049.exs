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

  defp generate_triplets(num), do: [num, num+3330, num+6660]

  defp are_permutations?([head|tail]), do: Enum.all?(tail, &(is_permutation?(&1, head)))

  defp is_permutation?(a, b), do: Enum.sort(Integer.digits(a)) == Enum.sort(Integer.digits(b))

  def solve do
    1_000..3_339
    |> Stream.filter(&(&1 != 1487))
    |> Stream.filter(&prime?/1)
    |> Stream.map(&generate_triplets/1)
    |> Stream.filter(&are_permutations?/1)
    |> Stream.filter(fn x -> Enum.all?(x, &prime?/1) end)
    |> Enum.to_list()
    |> List.first()
    |> Enum.map(&Integer.digits/1)
    |> List.flatten()
    |> Integer.undigits()
  end
end

IO.puts Problem049.solve
