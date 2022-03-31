#!/usr/bin/env elixir
defmodule Problem719 do
  @moduledoc """
  We define an S-number to be a natural number, n, that is a perfect square and its square root can be obtained by
  splitting the decimal representation of n into 2 or more numbers then adding the numbers.

  For example, 81 is an S-number because √81 = 8 + 1.

  - 6724 is an S-number: √6724 = 6 + 72 + 4.
  - 8281 is an S-number: √8281 = 8 + 2 + 81 = 82 + 8 + 1.
  - 9801 is an S-number: √9801 = 98 + 0 + 1.

  Further we define T(N) to be the sum of all S numbers n <= N . You are given T(10^4) = 41333.

  Find T(10^12)
  """
  defp chunk_digits({digit, 1}, acc), do: {:cont, acc ++ [digit], []}
  defp chunk_digits({digit, 0}, acc), do: {:cont, acc ++ [digit]}

  defp get_partition(digits, partition_number) do
  chunk_sequence = Integer.digits(partition_number, 2)

    digits
    |> Enum.reverse()
    |> Enum.zip([1] ++ Enum.reverse(chunk_sequence) ++ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    |> Enum.reverse()
    |> Enum.chunk_while([], &chunk_digits/2, &({:cont, &1}))
    |> Enum.map(&Integer.undigits/1)
  end

  defp digit_partitions(number) do
    digits = Integer.digits(number)

    1 .. 2**(length(digits)-1)-1
    |> Enum.map(&(get_partition(digits, &1)))
  end

  defp digit_sums(number) do
    number
    |> digit_partitions()
    |> Stream.map(&Enum.sum/1)
  end

  defp is_S_number?({square_root, number}) do
    number
    |> digit_sums()
    |> Enum.any?(&(&1 == square_root))
  end

  defp function_T(max_number) do
    4
    |> Stream.iterate(&(&1+1))
    |> Stream.map(&({&1, &1*&1}))
    |> Stream.take_while(fn {_sqrt_n, n} -> n <= max_number end)
    |> Stream.filter(&is_S_number?/1)
    |> Stream.map(fn {_sqrt_n, n} -> n end)
    |> Enum.sum()
  end

  def solve do
#    function_T(10 ** 4)
    function_T(10 ** 12)
  end
end

IO.puts Problem719.solve
