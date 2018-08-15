#!/usr/bin/env elixir
defmodule Problem021 do
  @moduledoc """
  Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.
  """

  defp divisors(x, n, divisors) when n == x, do: [ n | divisors ]
  defp divisors(x, n, divisors) when rem(x, n) == 0, do: divisors(x, n+1, [n | divisors])
  defp divisors(x, n, divisors), do: divisors(x, n+1, divisors)
  defp divisors(1), do: [1]
  defp divisors(x) when is_integer(x) and x > 0, do: divisors(x, 1, [])
  
  defp divisor_sum(1), do: 1
  defp divisor_sum(x) when x > 1, do: divisors(x) |> List.delete(x) |> Enum.sum()
  
  defp is_amicable(x), do: x == divisor_sum(divisor_sum(x)) and x !== divisor_sum(x)
  
  def solve do
    1..10000
    |> Stream.filter(&is_amicable(&1))
    |> Enum.sum()
  end
end

IO.puts Problem021.solve
