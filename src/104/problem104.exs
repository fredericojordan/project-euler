#!/usr/bin/env elixir
defmodule Problem104 do
  @moduledoc """
  The Fibonacci sequence is defined by the recurrence relation:

  F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
  It turns out that F[541], which contains 113 digits, is the first Fibonacci number for which the last nine digits are
  1-9 pandigital (contain all the digits 1 to 9, but not necessarily in order). And F[2749], which contains 575 digits,
  is the first Fibonacci number for which the first nine digits are 1-9 pandigital.

  Given that F[k] is the first Fibonacci number for which the first nine digits AND the last nine digits are 1-9
  pandigital, find k.
  """

  defp fibonacci_sequence(), do: Stream.unfold({[1, 0], 1}, fn {[a, b], index} -> {{a, index}, {[a+b, a], index+1}} end)

  defp pandigital?(numbers) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
    |> Enum.all?(&(Enum.member?(numbers, &1)))
  end

  defp start_pandigital?({num, _index}) do
    num
    |> Integer.digits()
    |> Enum.take(9)
    |> pandigital?()
  end

  defp end_pandigital?({num, _index}) do
    num
    |> rem(1000000000)
    |> Integer.digits()
    |> pandigital?()
  end

  def solve do
    fibonacci_sequence()
    |> Stream.filter(&end_pandigital?/1)
    |> Stream.filter(&start_pandigital?/1)
    |> Enum.take(1)
    |> List.first()
    |> elem(1)
  end

end

IO.puts Problem104.solve
