#!/usr/bin/env elixir
defmodule Problem686 do
  @moduledoc """
  2^7 = 128 is the first power of two whose leading digits are "12".
  The next power of two whose leading digits are "12" is 2^80.

  Define p(L,n) to be the nth-smallest value of j such that the base 10 representation of 2^j begins with the digits of
  L.
  So p(12,1) = 7 and p(12,2) = 80.

  You are also given that p(123,45) = 12710.

  Find p(123, 678910).
  """

  defp next_power({n, power}) when power > 1_000_000_000_000_000_000_000, do: {n + 1, 2 * div(power, 1_000)}
  defp next_power({n, power}), do: {n + 1, 2 * power}

  defp powers, do: Stream.iterate({0, 1}, &next_power/1)

  defp starts_with_digits?(number, digits) when number < digits, do: :false
  defp starts_with_digits?(number, digits) do
    [number, digits]
    |> Enum.map(&Integer.digits/1)
    |> Enum.zip()
    |> Enum.all?(fn {a, b} -> a == b end)
  end

  defp function_p(varL, nth) do
    powers()
    |> Stream.filter(fn {_n, power} -> starts_with_digits?(power, varL) end)
    |> Enum.take(nth)
    |> Enum.map(fn {n, _power} -> n end)
    |> List.last()
  end

  def solve do
    function_p(123, 678910)
  end
end

IO.puts Problem686.solve
