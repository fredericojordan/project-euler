#!/usr/bin/env elixir
defmodule Problem097 do
  @moduledoc """
  The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form (2^6972593)-1; it contains exactly 2,098,960 digits.

  Subsequently other Mersenne primes, of the form (2^p)-1, have been found which contain more digits.

  However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433x(2^7830457)+1.

  Find the last ten digits of this prime number.
  """

  defp pow_mod10000000000(_, 0), do: 1
  defp pow_mod10000000000(x, n) when rem(n, 2) != 0 do
    x * pow_mod10000000000(x, n - 1)
    |> Integer.digits()
    |> Enum.take(-10)
    |> Integer.undigits()
  end
  defp pow_mod10000000000(x, n) do
    result = pow_mod10000000000(x, div(n, 2))
    result * result
    |> Integer.digits()
    |> Enum.take(-10)
    |> Integer.undigits()
  end

  def solve do
    pow_mod10000000000(2, 7830457)
    |> Kernel.*(28433)
    |> Kernel.+(1)
    |> Integer.digits()
    |> Enum.take(-10)
    |> Integer.undigits()
  end
end

IO.puts Problem097.solve
