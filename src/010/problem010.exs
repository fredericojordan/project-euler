#!/usr/bin/env elixir
defmodule Problem010 do
  defp can_divide(x, divisors) do
    divisors
    |> Enum.take_while(&(&1*&1 <= x))
    |> Enum.map(&rem(x, &1) == 0)
    |> Enum.reduce(&or/2)
  end
  
  defp generate_primes(n, primes, limit) do
    cond do
      n > limit -> primes
      can_divide(n, primes) -> generate_primes(n+2, primes, limit)
      true -> generate_primes(n+2, primes ++ [n], limit)
    end
  end
  
  defp generate_primes(limit) when limit > 5, do: generate_primes(5, [2, 3], limit)
  defp generate_primes(limit) when limit == 3 or limit == 4, do: [2, 3]
  defp generate_primes(limit) when limit == 2, do: [2]
  defp generate_primes(limit) when limit < 2, do: []

  def solve do
    generate_primes(2_000_000)
    |> Enum.sum()
  end
end

IO.inspect Problem010.solve
