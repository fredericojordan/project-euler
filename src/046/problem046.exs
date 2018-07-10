#!/usr/bin/env elixir
defmodule Problem046 do
  @moduledoc """
  It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

    9 = 7 + 2×1²
    15 = 7 + 2×2²
    21 = 3 + 2×3²
    25 = 7 + 2×3²
    27 = 19 + 2×2²
    33 = 31 + 2×1²

  It turns out that the conjecture was false.

  What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
  """
  defp prime?(1), do: false
  defp prime?(2), do: true
  defp prime?(x) when x > 2 do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end

  def can_be_written?(num) do
    Stream.iterate(1,&(&1+1))
    |> Stream.take_while(&(2*&1*&1 <= num))
    |> Enum.any?(&(prime?(num-2*&1*&1)))
  end

  def solve do
    Stream.iterate(9,&(&1+2))
    |> Stream.filter(&(!prime?(&1)))
    |> Stream.drop_while(&can_be_written?/1)
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem046.solve
