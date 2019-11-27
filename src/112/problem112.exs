#!/usr/bin/env elixir
defmodule Problem112 do
  @moduledoc """
  Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number;
  for example, 134468.

  Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

  We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

  Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand
  (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

  Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy
  numbers is equal to 90%.

  Find the least number for which the proportion of bouncy numbers is exactly 99%.
  """

  defp bouncy?(x) do
    x
    |> Integer.digits()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
    |> (fn x -> Enum.any?(x, &(&1 > 0)) and Enum.any?(x, &(&1 < 0)) end).()
  end

  def solve do
    Stream.iterate(1, &(&1+1))
    |> Stream.map(&bouncy?/1)
    |> Stream.transform({0, 0}, fn
      true, {bouncy_count, count} -> {[(bouncy_count+1)/(count+1)], {bouncy_count+1, count+1}}
      _, {bouncy_count, count} -> {[(bouncy_count)/(count+1)], {bouncy_count, count+1}}
    end)
    |> Stream.with_index(1)
    |> Stream.drop_while(fn {x, _index} -> x != 0.99 end)
    |> Enum.take(1)
    |> List.first()
    |> elem(1)
  end
end

IO.puts Problem112.solve
