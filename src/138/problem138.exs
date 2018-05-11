#!/usr/bin/env elixir
defmodule Problem138 do
  defp special_isoceles_triangles_plus(n) when n > 0 do
    for a <- 1..n,
        b <- a+1..n,
        5*a*a  + 8*a + 4 == 4*b*b,
        do: [b, a+1, a]
  end

  defp special_isoceles_triangles_minus(n) when n > 0 do
    for a <- 1..n,
        b <- a+1..n,
        5*a*a  - 8*a + 4 == 4*b*b,
        do: [b, a, a-1]
  end

  defp special_isoceles_triangles(n) when n > 0 do
    [
      special_isoceles_triangles_plus(n),
      special_isoceles_triangles_minus(n),
    ]
    |> Enum.concat()
  end

  def solve do
    special_isoceles_triangles(10_000)
#    |> Enum.map(&(List.first(&1)))
#    |> Enum.sort()
#    |> Enum.take(12)
#    |> Enum.sum()
#    |> Enum.count()
  end
end

IO.inspect Problem138.solve
#IO.puts Problem138.solve
