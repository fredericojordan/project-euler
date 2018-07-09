#!/usr/bin/env elixir
defmodule Problem549 do
  @moduledoc """
  The smallest number m such that 10 divides m! is m=5.
  The smallest number m such that 25 divides m! is m=10.

  Let s(n) be the smallest number m such that n divides m!.
  So s(10)=5 and s(25)=10.
  Let S(n) be ∑s(i) for 2 ≤ i ≤ n.
  S(100)=2012.

  Find S(10^8).
  """

  defp s(x) do
    Stream.unfold({1, 1}, fn {x, factorial} -> {{x, x*factorial}, {x+1, x*factorial}} end)
    |> Stream.filter(&(rem(elem(&1, 1), x) == 0))
    |> Enum.take(1)
    |> List.first()
    |> elem(0)
  end

  defp big_s(x) do
    2..x
    |> Stream.map(&s/1)
    |> Enum.sum()
  end

  def solve do
    big_s(100_000_000)
  end
end

IO.puts Problem549.solve
