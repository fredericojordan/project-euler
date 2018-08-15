#!/usr/bin/env elixir
defmodule Problem009 do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a² + b² = c²

  For example, 3² + 4² = 9 + 16 = 25 = 5².

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.

  Find the product abc.
  """

  defp pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- a+1..n,
        c = 1000 - b - a,
        a*a + b*b == c*c,
        do: a*b*c
  end

  def solve, do: pythagorean(1000) |> List.first()
end

IO.puts Problem009.solve
