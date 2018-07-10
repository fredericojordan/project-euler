#!/usr/bin/env elixir
defmodule Problem047 do
  @moduledoc """
  The first two consecutive numbers to have two distinct prime factors are:

  14 = 2 x 7
  15 = 3 x 5

  The first three consecutive numbers to have three distinct prime factors are:

  644 = 2² x 7 x 23
  645 = 3 x 5 x 43
  646 = 2 x 17 x 19.

  Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
  """

  defp factorize(x, n, prime_factors) when n > x, do: prime_factors
  defp factorize(x, n, prime_factors) when rem(x, n) == 0, do: factorize(div(x,n), n, [n | prime_factors])
  defp factorize(x, n, prime_factors), do: factorize(x, n+1, prime_factors)
  defp factorize(x) when is_integer(x) and x > 0, do: factorize(x, 2, [])

  defp unique_factors(x) do
    factorize(x)
    |> Enum.uniq()
    |> Enum.count()
  end

  def solve do
    Stream.iterate(1, &(&1+1))
    |> Stream.map(&unique_factors/1)
    |> Stream.chunk_every(4,1)
    |> Stream.with_index(1)
    |> Stream.filter(fn {list, _} -> Enum.all?(list, fn x -> x == 4 end) end)
    |> Enum.take(1)
    |> List.first()
    |> elem(1)
  end
end

IO.puts Problem047.solve
