#!/usr/bin/env elixir
defmodule Problem020 do
  @moduledoc """
  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!
  """

  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x*factorial(x-1)

  defp digit_sum(number), do: number |> Integer.digits |> Enum.sum()

  def solve, do: digit_sum(factorial(100))
end

IO.puts Problem020.solve
