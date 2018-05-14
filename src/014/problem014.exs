#!/usr/bin/env elixir
defmodule Problem014 do
  def collatz_seq([head | tail]) when head == 1, do: [head|tail]
  def collatz_seq([head | tail]) when rem(head, 2) == 0, do: collatz_seq([ div(head,2) | [head|tail]])
  def collatz_seq([head | tail]), do: collatz_seq([ 3*head+1 | [head|tail]])
  def collatz_seq(x), do: collatz_seq([x])

  def solve do
    1..1_000_000
    |> Enum.max_by(&(Enum.count(collatz_seq(&1))))
  end
end

IO.puts Problem014.solve
