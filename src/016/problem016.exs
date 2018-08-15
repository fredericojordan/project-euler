#!/usr/bin/env elixir
defmodule Problem016 do
  @moduledoc """
  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

  What is the sum of the digits of the number 2^1000?
  """

  def solve do
    :math.pow(2, 1000)
    |> round()
    |> Integer.digits()
    |> Enum.sum()
  end
end

IO.puts Problem016.solve
