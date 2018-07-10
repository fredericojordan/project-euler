#!/usr/bin/env elixir
defmodule Problem045 do
  @moduledoc """
  Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

  Triangle     T[n]=n(n+1)/2        1, 3, 6, 10, 15, ...
  Pentagonal   P[n]=n(3n-1)/2       1, 5, 12, 22, 35, ...
  Hexagonal    H[n]=n(2n-1)         1, 6, 15, 28, 45, ...

  It can be verified that T[285] = P[165] = H[143] = 40755.
  """

  defp hexagonal_numbers do
    Stream.unfold(144, fn x -> {x*(2*x-1), x+1} end)
  end

  defp integer?(num), do: num == trunc(num)

  defp pentagonal?(num) when num <= 0, do: false
  defp pentagonal?(num) do
    num
    |> Kernel.*(24)
    |> Kernel.+(1)
    |> :math.sqrt()
    |> Kernel.+(1)
    |> Kernel./(6)
    |> integer?()
  end

  defp triangle?(num) do
    n = trunc(:math.sqrt(2*num))
    n*(n+1) == 2*num
  end

  def solve do
    hexagonal_numbers()
    |> Stream.filter(&pentagonal?/1)
    |> Stream.filter(&triangle?/1)
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem045.solve
