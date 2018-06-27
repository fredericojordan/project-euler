#!/usr/bin/env elixir
defmodule Problem038 do
  @moduledoc """
  Take the number 192 and multiply it by each of 1, 2, and 3:

      192 × 1 = 192
      192 × 2 = 384
      192 × 3 = 576

  By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

  The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

  What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
  """
  defp pandigital?(num) when is_integer(num), do: pandigital?(Integer.to_string(num, 10))
  defp pandigital?(num) do
    "123456789"
    |> String.graphemes()
    |> Enum.all?(&(String.contains?(num, &1)))
  end

  defp concat_int(int1, int2) do
    [int1, int2]
    |> Enum.map(&Integer.digits/1)
    |> Enum.reduce(&Kernel.++/2)
    |> Integer.undigits()
  end

  defp concat_products(num) do
    Stream.unfold({1, 0}, fn {_, acc} when acc > 1.0e9 -> nil; {n, acc} -> {n*num, {n+1, concat_int(acc, n*num)}} end)
    |> Enum.reduce(&concat_int/2)
  end

  def solve do
    1..9_999
    |> Stream.map(&concat_products/1)
    |> Stream.filter(&(&1 >= 1.0e8 and &1 < 1.0e9))
    |> Stream.filter(&pandigital?/1)
    |> Enum.max()
  end
end

IO.puts Problem038.solve
