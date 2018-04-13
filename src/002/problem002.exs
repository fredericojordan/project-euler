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

  def solve, do: fib_acc(4000000)
end

defmodule Problem002_2 do
  defp fibonacci(1), do: 1
  defp fibonacci(2), do: 2
  defp fibonacci(x) when is_integer(x) and x > 0, do: fibonacci(x-1) + fibonacci(x-2)

  def solve do
    1..100
    |> Stream.map(&fibonacci(&1))
    |> Stream.take_while(&(&1 <= 4000000))
    |> Stream.filter(fn(x) -> rem(x, 2) == 0 end)
    |> Enum.sum()
  end
end

IO.puts Problem002.solve
IO.puts Problem002_2.solve
