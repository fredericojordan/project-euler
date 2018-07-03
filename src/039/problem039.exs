#!/usr/bin/env elixir
defmodule Problem039 do
  @moduledoc """
  If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

  {20,48,52}, {24,45,51}, {30,40,50}

  For which value of p ≤ 1000, is the number of solutions maximised?
  """

  defp pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- a+1..n,
        c = n - b - a,
        a*a + b*b == c*c,
        do: [a,b,c]
  end

  def solve do
    1..1_000
    |> Enum.max_by(&(Enum.count(pythagorean(&1))))
  end
end

IO.puts Problem039.solve
