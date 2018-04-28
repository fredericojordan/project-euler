#!/usr/bin/env elixir
defmodule Problem006 do

  defp square(x), do: x*x
  
  defp sum_of_squares(a, b) do
    a..b
    |> Stream.map(&square(&1))
    |> Enum.sum()
  end
  
  defp square_of_sum(a, b) do
    a..b
    |> Enum.sum()
    |> square()
  end

  def solve, do: square_of_sum(1,100) - sum_of_squares(1,100)
end

IO.puts Problem006.solve
