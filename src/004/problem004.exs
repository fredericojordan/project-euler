#!/usr/bin/env elixir
defmodule Problem004 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  defp reverse_number(x) do
  	x
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end
  
  defp is_palindrome(x), do: x == reverse_number(x)
  
  defp get_palindrome_multiples(a, b) do
    for x <- a..b,
        y <- a..b,
        is_palindrome(x*y),
        do: x*y
  end

  def solve do
    get_palindrome_multiples(100, 999)
    |> Enum.max()
  end
end

IO.puts Problem004.solve
