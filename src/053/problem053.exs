#!/usr/bin/env elixir
defmodule Problem053 do
  @moduledoc """
  There are exactly ten ways of selecting three from five, 12345:

      123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

  In combinatorics, we use the notation, {5}C[3] = 10.

  In general,

  {n}C[r] = n! / r!(n−r)!

  where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.

  It is not until n = 23, that a value exceeds one-million: {23}C[10] = 1144066.

  How many, not necessarily distinct, values of {n}C[r], for 1 ≤ n ≤ 100, are greater than one-million?
  """

  defp factorial(0), do: 1
  defp factorial(x), do: 1..x |> Enum.reduce(&Kernel.*/2)

  defp combinations(n, r), do: factorial(n)/(factorial(r)*factorial(n-r))

  defp generate_combinations do
    for n <- 23..100,
        r <- 1..n,
        do:
          combinations(n, r)
  end

  def solve do
    generate_combinations()
    |> Stream.filter(&(&1 > 1_000_000))
    |> Enum.count()
  end
end

IO.puts Problem053.solve
