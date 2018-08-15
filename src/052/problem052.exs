#!/usr/bin/env elixir
defmodule Problem052 do
  @moduledoc """
  It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

  Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
  """

  defp same_digits(num) do
    [
      num,
      2*num,
      3*num,
      4*num,
      5*num,
      6*num,
    ]
    |> Enum.map(&Integer.digits/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.map(&Integer.undigits/1)
    |> Enum.uniq()
    |> Enum.count()
    |> Kernel.==(1)
  end

  def solve do
    Stream.iterate(1, &(&1+1))
    |> Stream.filter(&same_digits/1)
    |> Stream.take(1)
    |> Enum.to_list()
    |> List.first()
  end
end

IO.puts Problem052.solve
