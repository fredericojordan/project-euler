#!/usr/bin/env elixir
defmodule Problem006 do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is,

  1² + 2² + ... + 10² = 385
  The square of the sum of the first ten natural numbers is,

  (1 + 2 + ... + 10)² = 55² = 3025
  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  """

  defp square(x), do: x*x
  
  defp sum_of_squares(a, b) do
    a..b
    |> Stream.map(&square(&1))
    |> Enum.sum()
  end
  
  defp square_of_sum(a, b) do
    a..b
    |> Enum.sum()
    |> square()
  end

  def solve, do: square_of_sum(1,100) - sum_of_squares(1,100)
end

IO.puts Problem006.solve
