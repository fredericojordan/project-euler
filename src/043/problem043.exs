#!/usr/bin/env elixir
defmodule Problem043 do
  @moduledoc """
  The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

  Let d[1] be the 1st digit, d[2] be the 2nd digit, and so on. In this way, we note the following:

  - d[2]d[3]d[4]=406 is divisible by 2
  - d[3]d[4]d[5]=063 is divisible by 3
  - d[4]d[5]d[6]=635 is divisible by 5
  - d[5]d[6]d[7]=357 is divisible by 7
  - d[6]d[7]d[8]=572 is divisible by 11
  - d[7]d[8]d[9]=728 is divisible by 13
  - d[8]d[9]d[10]=289 is divisible by 17

  Find the sum of all 0 to 9 pandigital numbers with this property.
  """

  defp permutate([]), do: [[]]
  defp permutate(list) do
    for x <- list,
        y <- permutate(list -- [x]),
        do:
          [x|y]
  end

  defp substring_divisible?(num_list) do
    rem(Integer.undigits(Enum.slice(num_list, 1..3)), 2) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 2..4)), 3) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 3..5)), 5) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 4..6)), 7) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 5..7)), 11) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 6..8)), 13) == 0 and
    rem(Integer.undigits(Enum.slice(num_list, 7..9)), 17) == 0
  end

  def solve do
    permutate([1,2,3,4,5,6,7,8,9,0])
    |> Stream.filter(&substring_divisible?/1)
    |> Stream.map(&Integer.undigits/1)
    |> Enum.sum()
  end
end

IO.puts Problem043.solve
