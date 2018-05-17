#!/usr/bin/env elixir
defmodule Problem138 do
  @moduledoc """
  Consider the isosceles triangle with base length, b = 16, and legs, L = 17.

  By using the Pythagorean theorem it can be seen that the height of the triangle, h = √(172 − 82) = 15, which is one less than the base length.

  With b = 272 and L = 305, we get h = 273, which is one more than the base length, and this is the second smallest isosceles triangle with the property that h = b ± 1.

  Find ∑ L for the twelve smallest isosceles triangles for which h = b ± 1 and b, L are positive integers.
  """

  def first_test([l, b, h]) do
    [l, b/2, h]
    |> Enum.map(fn x -> x*x end)
    |> Enum.all?(fn x -> trunc(x) == x end)
  end

  def second_test([l, b, h]) do
    IO.inspect([l, b, h])
    [2*l, b, 2*h]
    |> Enum.map(fn x -> trunc(x) end)
    |> Enum.map(fn x -> x*x end)
    |> (fn [a, b, c] -> a-b-c == 0 end).()
  end

  @doc """
  Generates a stream of special isoceles triangles in the form [L, b, h]

  Works by iterating b through the integers and calculating L on the assumption that h = b ± 1.

  Then filters for cases where L is an integer.
  """
  def special_isoceles_triangles() do
    Stream.iterate(1, &(&1+1))
    |> Stream.map(&({:math.sqrt(5*&1*&1  + 8*&1 + 4)/2,
                     :math.sqrt(5*&1*&1  - 8*&1 + 4)/2,
                     &1}))
    |> Stream.filter(&(elem(&1, 0) == trunc(elem(&1, 0)) or
                       elem(&1, 1) == trunc(elem(&1, 1))))
    |> Stream.map(fn x when elem(x, 0) == trunc(elem(x, 0)) -> [trunc(elem(x, 0)), elem(x, 2), elem(x, 2)+1]
                     x when elem(x, 1) == trunc(elem(x, 1)) -> [trunc(elem(x, 1)), elem(x, 2), elem(x, 2)-1] end)
    |> Stream.filter(&first_test(&1))
    |> Stream.filter(&second_test(&1))
  end

  def solve do
    special_isoceles_triangles()
    |> Enum.take(12)
    |> IO.inspect()
    |> Enum.map(&Enum.max/1)
    |> Enum.sum()
  end
end

IO.puts Problem138.solve
