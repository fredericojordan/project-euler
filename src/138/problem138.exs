#!/usr/bin/env elixir
defmodule Problem138 do
  defp special_isoceles_triangles_plus(n) when n > 0 do
    for a <- 1..n,
        b = :math.sqrt(1.25*a*a  + 2*a + 1),
        b == trunc(b),
        do: [trunc(b), a+1, a]
  end

  defp special_isoceles_triangles_minus(n) when n > 0 do
    for a <- 1..n,
        b = :math.sqrt(1.25*a*a  - 2*a + 1),
        b == trunc(b),
        do: [trunc(b), a, a-1]
  end

  defp special_isoceles_triangles(n) when n > 0 do
    [
      special_isoceles_triangles_plus(n),
      special_isoceles_triangles_minus(n),
    ]
    |> Enum.concat()
  end

  def solve do
    special_isoceles_triangles(500_000_000)
#    |> Enum.map(&(List.first(&1)))
#    |> Enum.sort()
#    |> Enum.take(12)
#    |> Enum.sum()
#    |> Enum.count()
  end
end

IO.inspect Problem138.solve
#IO.puts Problem138.solve
