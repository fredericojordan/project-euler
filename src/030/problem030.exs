#!/usr/bin/env elixir
defmodule Problem030 do
  @moduledoc """
  Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

  1634 = 1^4 + 6v4 + 3^4 + 4^4
  8208 = 8^4 + 2^4 + 0^4 + 8^4
  9474 = 9^4 + 4^4 + 7v4 + 4^4
  As 1 = 1^4 is not a sum it is not included.

  The sum of these numbers is 1634 + 8208 + 9474 = 19316.

  Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
  """

  defp digits_fifth_power(x) do
    x
    |> Integer.digits()
    |> Enum.map(&(trunc(:math.pow(&1, 5))))
    |> Enum.sum()
  end

  def solve do
    Stream.iterate(2, &(&1+1))
    |> Enum.take_while(&(&1 < 200_000))
    |> Stream.filter(&(&1 == digits_fifth_power(&1)))
    |> Enum.sum()
  end
end

IO.puts Problem030.solve
