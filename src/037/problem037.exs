#!/usr/bin/env elixir
defmodule Problem037 do
  @moduledoc """
  The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

  Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

  NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
  """

  defp is_prime(1), do: false
  defp is_prime(2), do: true
  defp is_prime(x) when x > 2 do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end

  defp right_truncable?(num) do
    Stream.unfold(num, fn 0 -> nil; n -> {n, div(n, 10)} end)
    |> Enum.all?(&is_prime/1)
  end

  defp left_truncable?(num) do
    Stream.unfold(Integer.digits(num), fn [] -> nil; [head|tail] -> {[head|tail], tail} end)
    |> Stream.map(&Integer.undigits/1)
    |> Enum.all?(&is_prime/1)
  end

  def solve do
    Stream.unfold(9, fn n -> {n, n+2} end)
    |> Stream.filter(&(left_truncable?(&1) and right_truncable?(&1)))
    |> Stream.take(11)
    |> Enum.sum()
  end
end

IO.puts Problem037.solve
