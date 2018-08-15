#!/usr/bin/env elixir
defmodule Problem015 do
  @moduledoc """
  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20×20 grid?
  """

  defp factorial(1), do: 1
  defp factorial(x) when is_integer(x) and x > 0, do: x*factorial(x-1)

  defp grid_routes(x) do
    factorial(2*x)/(factorial(x)*factorial(x))
    |> Kernel.trunc()
  end

  def solve, do: grid_routes(20)
end

IO.puts Problem015.solve
