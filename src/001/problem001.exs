#!/usr/bin/env elixir
defmodule Problem001 do
  def multiples_sum(0), do: 0
  def multiples_sum(x) when rem(x, 3) == 0 or rem(x, 5) == 0, do: x + multiples_sum(x-1)
  def multiples_sum(x), do: multiples_sum(x-1)

  def solve, do: multiples_sum(999)
end

IO.puts Problem001.solve
