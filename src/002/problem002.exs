#!/usr/bin/env elixir
defmodule Problem002 do
  defp fib_rec_acc({x, y}, acc, limit) do
    z = x+y

    cond do
      z > limit -> acc
      rem(z,2) == 0 -> fib_rec_acc({y, z}, acc+z, limit)
      true -> fib_rec_acc({y, z}, acc, limit)
    end
  end

  defp fib_acc(limit), do: fib_rec_acc({1,1}, 0, limit)

  def solve do
    fib_acc(4000000)
  end
end

IO.puts Problem002.solve
