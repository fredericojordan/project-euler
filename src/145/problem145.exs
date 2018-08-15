#!/usr/bin/env elixir
defmodule Problem145 do
  @moduledoc """
  Some positive integers n have the property that the sum `[ n + reverse(n) ]` consists entirely of odd (decimal) digits. For instance, `36 + 63 = 99` and `409 + 904 = 1313`. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either `n` or `reverse(n)`.

  There are 120 reversible numbers below one-thousand.

  How many reversible numbers are there below one-billion (10^9)?
  """

  defp is_reversible(x) when rem(x, 10) == 0, do: false
  defp is_reversible(x) do
      x
      |> Integer.digits()
      |> Enum.reverse()
      |> Integer.undigits()
      |> Kernel.+(x)
      |> Integer.digits()
      |> Enum.all?(fn(x) -> rem(x, 2) != 0 end)
  end

  def solve do
    1..1_000_000_000
    |> Stream.filter(&is_reversible(&1))
    |> Enum.count()
  end
end

IO.puts Problem145.solve
