#!/usr/bin/env elixir
defmodule Problem001 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """

  defp multiples_sum(0), do: 0
  defp multiples_sum(x) when rem(x, 3) == 0 or rem(x, 5) == 0, do: x + multiples_sum(x-1)
  defp multiples_sum(x), do: multiples_sum(x-1)

  def solve, do: multiples_sum(999)
end

IO.puts Problem001.solve
