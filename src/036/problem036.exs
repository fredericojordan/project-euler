#!/usr/bin/env elixir
defmodule Problem036 do
  @moduledoc """
  The decimal number, 585 = 1001001001 base 2 (binary), is palindromic in both bases.

  Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

  (Please note that the palindromic number, in either base, may not include leading zeros.)
  """

  defp is_palindrome?(x) do
    x == x
      |> Integer.to_string()
      |> String.reverse()
      |> String.to_integer()
  end

  defp is_binary_palindrome?(x) do
    Integer.to_string(x, 2) == x
      |> Integer.to_string(2)
      |> String.reverse()
  end

  def solve do
    1..999_999
    |> Stream.filter(&is_palindrome?/1)
    |> Stream.filter(&is_binary_palindrome?/1)
    |> Enum.sum()
  end
end

IO.puts Problem036.solve
