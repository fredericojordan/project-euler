#!/usr/bin/env elixir
defmodule Problem003 do
  defp factorization(number, factor, prime_factors) do
    cond do
      factor > number -> prime_factors
      rem(number, factor) == 0 -> factorization(div(number,factor), factor, [factor | prime_factors])
      true -> factorization(number, factor+1, prime_factors)
    end
  end

  def get_prime_factors(number), do: factorization(number, 2, [])

  def solve, do: Enum.max(get_prime_factors(600851475143))
end

IO.puts Problem003.solve
