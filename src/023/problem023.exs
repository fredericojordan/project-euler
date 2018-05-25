#!/usr/bin/env elixir
defmodule Problem023 do
  @moduledoc """
  A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the
  sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

  A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum
  exceeds n.

  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of
  two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be
  written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even
  though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than
  this limit.

  Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
  """

  @upper_limit 28_123

  defp divisors(x, n, divisors) when n == x, do: [ n | divisors ]
  defp divisors(x, n, divisors) when rem(x, n) == 0, do: divisors(x, n+1, [n | divisors])
  defp divisors(x, n, divisors), do: divisors(x, n+1, divisors)
  defp divisors(1), do: [1]
  defp divisors(x) when is_integer(x) and x > 0, do: divisors(x, 1, [])

  defp abundant?(x), do: Enum.sum(divisors(x)) > 2*x

  defp abundants(x) when x < 12, do: []
  defp abundants(x) do
    12..x
    |> Stream.filter(&abundant?/1)
    |> Enum.to_list()
  end

  defp abundant_sum?(x, _) when x < 24, do: false
  defp abundant_sum?(x, abundant_list) do
    12..round((x+1)/2)
    |> Enum.any?(&(Enum.member?(abundant_list, &1) and
                   Enum.member?(abundant_list, x-&1)))
  end

  def solve do
    abundant_list = abundants(@upper_limit)

    1..@upper_limit
    |> Stream.filter(&(!abundant_sum?(&1, abundant_list)))
    |> Enum.sum()
  end
end

IO.puts Problem023.solve
