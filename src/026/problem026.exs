#!/usr/bin/env elixir
defmodule Problem026 do
  @moduledoc """
  A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

  - 1/2 = 0.5
  - 1/3 = 0.(3)
  - 1/4 = 0.25
  - 1/5 = 0.2
  - 1/6 = 0.1(6)
  - 1/7 = 0.(142857)
  - 1/8 = 0.125
  - 1/9 = 0.(1)
  - 1/10 = 0.1

  Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

  Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
  """

  @repetitions 5

  defp generate_decimals(denom) do
    Stream.unfold([denom, 1, []], fn [d, n, l] -> {[div(n, d) | l], [d, 10*rem(n, d), [div(n, d) | l]]} end)
  end

  defp is_cycle(l, n) do
    l
    |> Stream.take(@repetitions*n)
    |> Stream.chunk_every(n)
    |> Enum.uniq()
    |> Enum.count()
    |> Kernel.==(1)
  end

  defp is_cycle(l) do
    1..div(Enum.count(l), @repetitions)
    |> Enum.any?(&(is_cycle(l, &1)))
  end

  defp get_cycle_length(l) do
    1..div(Enum.count(l), @repetitions)
    |> Stream.filter(&(is_cycle(l, &1)))
    |> Enum.take(1)
    |> List.first()
  end

  defp recurring_cycle_length(x) do
    generate_decimals(x)
    |> Stream.drop(@repetitions)
    |> Stream.drop_while(&(!is_cycle(&1)))
    |> Enum.take(1)
    |> List.first()
    |> get_cycle_length()
  end

  def solve do
    1..1_000
    |> Enum.max_by(&recurring_cycle_length/1)
  end
end

IO.puts Problem026.solve
