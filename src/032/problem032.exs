#!/usr/bin/env elixir
defmodule Problem032 do
  @moduledoc """
  We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

  The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

  Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

  HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
  """

  def permutate([]), do: [[]]
  def permutate(list) do
    for x <- list,
        y <- permutate(list -- [x]),
        do:
          [x|y]
  end

  def generate_slices(list) do
    len = Enum.count(list)
    for x <- 1..len-2,
        y <- 1..len-1-x,
        do:
          [Enum.slice(list, 0, x), Enum.slice(list, x, y), Enum.slice(list, x+y, len-x-y)]
          |> Enum.map(&Integer.undigits/1)
  end

  defp product_equals([multiplicand, multiplier, product]), do: multiplicand*multiplier == product

  def solve do
    permutate([1,2,3,4,5,6,7,8,9])
    |> Stream.map(&generate_slices/1)
    |> Enum.reduce(&Kernel.++/2)
    |> Enum.filter(&product_equals/1)
    |> Enum.map(&(Enum.at(&1,-1)))
    |> Enum.uniq()
    |> Enum.sum()
  end
end

IO.puts Problem032.solve
