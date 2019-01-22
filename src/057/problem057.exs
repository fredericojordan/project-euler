#!/usr/bin/env elixir
defmodule Problem057 do
  @moduledoc """
  It is possible to show that the square root of two can be expressed as an infinite continued fraction.

  √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

  By expanding this for the first four iterations, we get:

  1 + 1/2 = 3/2 = 1.5
  1 + 1/(2 + 1/2) = 7/5 = 1.4
  1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
  1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

  The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

  In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?
  """

  defp gcd(a,0), do: abs(a)
  defp gcd(a,b), do: gcd(b, rem(a,b))

  defp lcm(a,b), do: div(abs(a*b), gcd(a,b))

  defp sum_fractions({n1,d1}, {n2,d2}) do
    lcm = lcm(d1,d2)

    {n1*(div(lcm,d1)) + n2*(div(lcm,d2)), lcm}
  end

  defp invert_fraction({n,d}), do: {d,n}

  defp prob_iter(0), do: sum_fractions({2,1}, {1, 2})
  defp prob_iter(step), do: sum_fractions({2,1}, invert_fraction(prob_iter(step-1)))

  defp get_problem_iteration(step), do: sum_fractions({1,1}, invert_fraction(prob_iter(step-1)))

  def solve do
    Stream.iterate(1, &(&1+1))
    |> Stream.map(&get_problem_iteration/1)
    |> Stream.take(1_000)
    |> Enum.count(fn {n,d} -> length(Integer.digits(n)) > length(Integer.digits(d)) end)
  end

end

IO.inspect Problem057.solve
