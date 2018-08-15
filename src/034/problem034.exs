#!/usr/bin/env elixir
defmodule Problem034 do
  @moduledoc """
  145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

  Find the sum of all numbers which are equal to the sum of the factorial of their digits.

  Note: as 1! = 1 and 2! = 2 are not sums they are not included.
  """

  defp factorial(0), do: 1
  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x*factorial(x-1)
  #defp factorial(x), do: 1..x |> Enum.reduce(&Kernel.*/2)

  defp is_factorial_sum?(number) do
    number ==
      number
      |> Integer.digits()
      |> Enum.map(&(factorial(&1)))
      |> Enum.sum()
  end

  def solve do
    3..40_585  # magic number!
    |> Stream.filter(&(is_factorial_sum?(&1)))
    |> Enum.to_list()
    |> Enum.sum()
  end
end

IO.puts Problem034.solve
