#!/usr/bin/env elixir
defmodule Problem040 do
  @moduledoc """
  An irrational decimal fraction is created by concatenating the positive integers:

      0.123456789101112131415161718192021...

  It can be seen that the 12th digit of the fractional part is 1.

  If d[n] represents the nth digit of the fractional part, find the value of the following expression.

  d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
  """

  def unfold_digits({m, []}), do: unfold_digits({m+1, Integer.digits(m)})
  def unfold_digits({m, [head|tail]}), do: {head, {m, tail}}

  def champernowne_at(x) do
    Stream.unfold({1, []}, &unfold_digits/1)
    |> Stream.take(x)
    |> Enum.take(-1)
    |> List.first()
  end

  def solve do
    [1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]
    |> Enum.map(&champernowne_at/1)
    |> Enum.reduce(&Kernel.*/2)
  end
end

IO.puts Problem040.solve
