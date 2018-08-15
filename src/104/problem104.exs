#!/usr/bin/env elixir
defmodule Problem104 do
  @moduledoc """
  The Fibonacci sequence is defined by the recurrence relation:

  F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
  It turns out that F[541], which contains 113 digits, is the first Fibonacci number for which the last nine digits are 1-9 pandigital (contain all the digits 1 to 9, but not necessarily in order). And F[2749], which contains 575 digits, is the first Fibonacci number for which the first nine digits are 1-9 pandigital.

  Given that F[k] is the first Fibonacci number for which the first nine digits AND the last nine digits are 1-9 pandigital, find k.
  """

  defp fibonacci_sequence(), do: Stream.unfold([1, 0], fn [a, b] -> {a, [a+b, a]} end)

  defp pandigital?(num) when is_integer(num), do: pandigital?(Integer.to_string(num, 10))
  defp pandigital?(num) do
    "123456789"
    |> String.graphemes()
    |> Enum.all?(&(String.contains?(num, &1)))
  end

  defp start_pandigital?({num, _}) do
    num
    |> Integer.digits()
    |> Enum.take(9)
    |> Integer.undigits()
    |> pandigital?()
  end

  defp end_pandigital?({num, _}) do
    num
    |> Integer.digits()
    |> Enum.take(-9)
    |> Integer.undigits()
    |> pandigital?()
  end

  def solve do
    fibonacci_sequence()
    |> Stream.with_index(1)
    |> Stream.filter(&end_pandigital?/1)
    |> Stream.filter(&start_pandigital?/1)
    |> Enum.take(1)
    |> List.first()
    |> elem(1)
  end

end

IO.puts Problem104.solve
