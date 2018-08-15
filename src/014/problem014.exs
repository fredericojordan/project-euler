#!/usr/bin/env elixir
defmodule Problem014 do
  @moduledoc """
  The following iterative sequence is defined for the set of positive integers:

  - n → n/2 (n is even)
  - n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

      13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
  """

  defp collatz_seq([head | tail]) when head == 1, do: [head|tail]
  defp collatz_seq([head | tail]) when rem(head, 2) == 0, do: collatz_seq([ div(head,2) | [head|tail]])
  defp collatz_seq([head | tail]), do: collatz_seq([ 3*head+1 | [head|tail]])
  defp collatz_seq(x), do: collatz_seq([x])

  def solve do
    1..1_000_000
    |> Enum.max_by(&(Enum.count(collatz_seq(&1))))
  end
end

IO.puts Problem014.solve
