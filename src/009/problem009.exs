#!/usr/bin/env elixir
defmodule Problem009 do
  defp pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- a+1..n,
        c <- b+1..n,
        a + b + c == n,
        a*a + b*b == c*c,
        do: a*b*c
  end

  def solve, do: pythagorean(1000) |> List.first()
end

IO.puts Problem009.solve
