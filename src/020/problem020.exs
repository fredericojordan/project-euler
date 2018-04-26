#!/usr/bin/env elixir
defmodule Problem020 do
  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x*factorial(x-1)

  defp digit_sum(number), do: number |> Integer.digits |> Enum.sum()

  def solve, do: digit_sum(factorial(100))
end

IO.puts Problem020.solve
