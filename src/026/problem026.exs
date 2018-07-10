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

  defp generate_remainders(denom) do
    Stream.unfold([denom, 1, []], fn [d, n, l] -> {[rem(n, d) | l], [d, 10*rem(n, d), [rem(n, d) | l]]} end)
  end

  defp no_duplicates?(list) do
    list
    |> Enum.uniq()
    |> Enum.count()
    |> Kernel.==(Enum.count(list))
  end

  def get_cycle_length(num) do
    generate_remainders(num)
    |> Stream.drop_while(&no_duplicates?/1)
    |> Enum.take(1)
    |> List.first()
    |> Enum.count()
  end

  def solve do
    1..1_000
    |> Enum.max_by(&get_cycle_length/1)
  end
end

IO.puts Problem026.solve
