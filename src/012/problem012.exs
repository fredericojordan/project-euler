#!/usr/bin/env elixir
defmodule Problem012 do
  defp divisors(x, n, divisors) when n == x, do: [ n | divisors ]
  defp divisors(x, n, divisors) when rem(x, n) == 0, do: divisors(x, n+1, [n | divisors])
  defp divisors(x, n, divisors), do: divisors(x, n+1, divisors)
  defp divisors(1), do: [1]
  defp divisors(x) when is_integer(x) and x > 0, do: divisors(x, 1, [])

  def triangle_numbers() do
    Stream.unfold([1, 0], fn [n, acc] -> {acc+n, [n+1, acc+n]} end)
  end

  def solve do
    triangle_numbers()
    |> Stream.filter(&(divisors(&1) |> Enum.count > 500))
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem012.solve
