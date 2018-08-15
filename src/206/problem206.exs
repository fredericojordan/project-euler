#!/usr/bin/env elixir
defmodule Problem206 do
  @moduledoc """
  Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,

  where each “_” is a single digit.
  """

  def solve do
    Stream.iterate(1_010_101_010, &(&1 + 2))
    |> Stream.filter(&(match?([1, _, 2, _, 3, _, 4, _, 5, _, 6, _, 7, _, 8, _, 9, _, 0], Integer.digits(&1*&1))))
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem206.solve
