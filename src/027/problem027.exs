#!/usr/bin/env elixir
defmodule Problem027 do
  @moduledoc """
  Euler discovered the remarkable quadratic formula:
  
  - n^2 + n + 41
  
  It turns out that the formula will produce 40 primes for the consecutive integer values 0 ≤ n ≤ 39. However, when n = 40, 40^2 + 40 + 41 = 40(40+1) + 41 is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
  
  The incredible formula n^2 − 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.
  
  Considering quadratics of the form:
  
  - n^2+an+b, where |a|<1000 and |b|≤1000
  
      where |n| is the modulus/absolute value of n
      e.g. |11| = 11 and |−4| = 4
  
  Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.
  """

  defp is_prime(x) when x<0, do: is_prime(-x)
  defp is_prime(0), do: false
  defp is_prime(1), do: false
  defp is_prime(2), do: true
  defp is_prime(x) when x > 2 do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end

  def generate_coefficients() do
    for a <- -1000..1000,
        b <- -1000..1000 do
      [a, b]
    end
  end

  def prime_generation_length([a, b]) do
    Stream.iterate(0, &(&1+1))
    |> Stream.map(&(&1*&1 + &1*b + a))
    |> Stream.take_while(&is_prime/1)
    |> Enum.count()
  end

  def solve do
    generate_coefficients()
    |> Enum.max_by(&prime_generation_length/1)
    |> Enum.reduce(&Kernel.*/2)
  end
end

IO.puts Problem027.solve
