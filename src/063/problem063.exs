#!/usr/bin/env elixir
defmodule Problem063 do
  @moduledoc """
  The 5-digit number, 16807=7<sup>5</sup>, is also a fifth power. Similarly, the 9-digit number, 134217728=8<sup>9</sup>, is a ninth power.

  How many n-digit positive integers exist which are also an nth power?
  """

  defp power_length(number, power) do
    number
    |> :math.pow(power)
    |> trunc()
    |> Integer.digits()
    |> Enum.count()
  end

  defp same_power_len_bases(power) do
    1..9
    |> Stream.drop_while(&(power_length(&1, power) < power))
    |> Enum.take_while(&(power_length(&1, power) == power))
  end

  def solve do
    1..100
    |> Enum.map(&same_power_len_bases/1)
    |> List.flatten()
    |> Enum.count()
  end
end

IO.puts Problem063.solve
