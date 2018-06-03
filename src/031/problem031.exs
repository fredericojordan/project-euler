#!/usr/bin/env elixir
defmodule Problem031 do
  @moduledoc """
  In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

  1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

  It is possible to make £2 in the following way:

  1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

  How many different ways can £2 be made using any number of coins?
  """

  defp generate_combinations(x) do
    for p1 <- 0..div(x, 1),
        p2 <- 0..div(x, 2),
        p5 <- 0..div(x, 5),
        p10 <- 0..div(x, 10),
        p20 <- 0..div(x, 20),
        p50 <- 0..div(x, 50),
        p100 <- 0..div(x, 100),
        p1+ (2*p2) + (5*p5) + (10*p10) + (20*p20) + (50*p50) + (100*p100) == x do
      [p1, p2, p5, p10, p20, p50, p100]
    end
  end

  def solve do
    generate_combinations(200)
    |> Enum.count()
    |> Kernel.+(1)  # We are ignoring £2 on calculations and adding it's trivial solution afterwards
  end
end

IO.puts Problem031.solve
