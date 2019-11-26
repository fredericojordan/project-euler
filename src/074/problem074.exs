#!/usr/bin/env elixir
defmodule Problem074 do
  @moduledoc """
  The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

    1! + 4! + 5! = 1 + 24 + 120 = 145

  Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out
  that there are only three such loops that exist:

      169 → 363601 → 1454 → 169
      871 → 45361 → 871
      872 → 45362 → 872

  It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

      69 → 363600 → 1454 → 169 → 363601 (→ 1454)
      78 → 45360 → 871 → 45361 (→ 871)
      540 → 145 (→ 145)

  Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting
  number below one million is sixty terms.

  How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?
  """

  defp factorial(0), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x * factorial(x-1)

  defp factorial_digit_sum(x) do
    x
    |> Integer.digits()
    |> Enum.map(&factorial/1)
    |> Enum.sum()
  end

  defp factorial_digit_sum_loop(x) do
    x
    |> Stream.iterate(&factorial_digit_sum/1)
    |> Enum.reduce_while([], fn x, acc ->
      if Enum.member?(acc, x) do
        {:halt, acc}
      else
        {:cont, acc ++ [x]}
      end
    end)
  end

  def solve do
    1..1_000_000
    |> Stream.map(&factorial_digit_sum_loop/1)
    |> Stream.map(&Enum.count/1)
    |> Stream.filter(&(&1 == 60))
    |> Enum.count()
  end
end

IO.puts Problem074.solve
