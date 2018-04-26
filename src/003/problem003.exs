#!/usr/bin/env elixir
defmodule Problem003 do
  defp factorize(x, n, prime_factors) when n > x, do: prime_factors
  defp factorize(x, n, prime_factors) when rem(x, n) == 0, do: factorize(div(x,n), n, [n | prime_factors])
  defp factorize(x, n, prime_factors), do: factorize(x, n+1, prime_factors)
  defp factorize(x) when is_integer(x) and x > 0, do: factorize(x, 2, [])

  def solve, do: factorize(600851475143) |> Enum.max()
end

IO.puts Problem003.solve
