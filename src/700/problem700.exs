#!/usr/bin/env elixir
defmodule Problem700 do
  @moduledoc """
  Leonhard Euler was born on 15 April 1707.

  Consider the sequence 1504170715041707n mod 4503599627370517.

  An element of this sequence is defined to be an Eulercoin if it is strictly smaller than all previously found
  Eulercoins.

  For example, the first term is 1504170715041707 which is the first Eulercoin. The second term is 3008341430083414
  which is greater than 1504170715041707 so is not an Eulercoin. However, the third term is 8912517754604 which is small
  enough to be a new Eulercoin.

  The sum of the first 2 Eulercoins is therefore 1513083232796311.

  Find the sum of all Eulercoins.
  """

  defp if_smallest(elem, acc) when elem < acc, do: {:cont, elem, elem}
  defp if_smallest(_elem, acc) when acc <= 1, do: {:halt, 0}
  defp if_smallest(_elem, acc), do: {:cont, acc}

  defp eulercoins do
    1504170715041707
    |> Stream.iterate(&(rem(&1 + 1504170715041707, 4503599627370517)))
    |> Stream.chunk_while(1504170715041708, &if_smallest/2, &({:cont, &1}))
  end

  def solve do
    eulercoins()
    |> Stream.scan(&(&1 + &2))
    |> Enum.map(&IO.inspect/1)
  end
end

IO.inspect Problem700.solve
