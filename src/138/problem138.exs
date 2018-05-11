#!/usr/bin/env elixir
defmodule Problem138 do
  @doc """
  Generates a stream of special isoceles triangles in the form [L, b, h]
  """
  def special_isoceles_triangles() do
    Stream.iterate(2, &(&1+1))
    |> Stream.map(&({:math.sqrt(5*&1*&1/4  + 2*&1 + 1), :math.sqrt(5*&1*&1/4  - 2*&1 + 1), &1}))
    |> Stream.filter(&(elem(&1, 0) == trunc(elem(&1, 0)) or elem(&1, 1) == trunc(elem(&1, 1))))
    |> Stream.map(fn x when elem(x, 0) == trunc(elem(x, 0)) -> [trunc(elem(x, 0)), elem(x, 2), elem(x, 2)+1]
                     x -> [trunc(elem(x, 1)), elem(x, 2), elem(x, 2)-1] end)
  end

  def solve do
    special_isoceles_triangles()
    |> Enum.take(12)
    |> Enum.map(&Enum.max/1)
    |> Enum.sum()
  end
end

IO.puts Problem138.solve
