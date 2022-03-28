#!/usr/bin/env elixir
defmodule Problem092 do
  @moduledoc """
  A number chain is created by continuously adding the square of the digits in a number to form a new number until it
  has been seen before.

  For example,

      44 → 32 → 13 → 10 → 1 → 1
      85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

  Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY
  starting number will eventually arrive at 1 or 89.

  How many starting numbers below ten million will arrive at 89?
  """

  defp link(num) do
    num
    |> Integer.digits()
    |> Enum.map(&(&1 ** 2))
    |> Enum.sum()
  end

  defp chain(num), do: Stream.iterate(num, &link/1)

  defp _1_or_89?(num) do
    num
    |> chain()
    |> Stream.drop_while(&(&1 != 1 and &1 != 89))
    |> Enum.take(1)
    |> List.first()
  end

  def solve do
    1..9_999_999
    |> Stream.filter(&(_1_or_89?(&1) == 89))
    |> Enum.count()
  end
end

IO.puts Problem092.solve
