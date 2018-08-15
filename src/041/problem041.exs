#!/usr/bin/env elixir
defmodule Problem041 do
  @moduledoc """
  We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

  What is the largest n-digit pandigital prime that exists?
  """

  defp prime?(1), do: false
  defp prime?(2), do: true
  defp prime?(x) when x > 2 do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end

  defp permutate([]), do: [[]]
  defp permutate(list) do
    for x <- list,
        y <- permutate(list -- [x]),
        do:
          [x|y]
  end

  def solve do
    permutate([1,2,3,4,5,6,7])
    |> Stream.map(&Integer.undigits/1)
    |> Stream.filter(&prime?/1)
    |> Enum.max()
  end

end

IO.puts Problem041.solve
