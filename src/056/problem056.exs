#!/usr/bin/env elixir
defmodule Problem056 do
  @moduledoc """
  A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

  Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
  """

  defp power(base, exp), do: List.duplicate(base, exp) |> Enum.reduce(&Kernel.*/2)

  defp generate_digit_sums do
    for a <- 1..100,
        b <- 1..100,
        do:
          power(a, b)
          |> Integer.digits()
          |> Enum.sum()
  end

  def solve do
    generate_digit_sums()
    |> Enum.max()
  end
end

IO.puts Problem056.solve
