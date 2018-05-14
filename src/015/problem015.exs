#!/usr/bin/env elixir
defmodule Problem015 do
  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x*factorial(x-1)

  defp grid_routes(x) do
    factorial(2*x)/(factorial(x)*factorial(x))
    |> Kernel.trunc()
  end

  def solve(), do: grid_routes(20)
end

IO.puts Problem015.solve
