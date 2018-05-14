#!/usr/bin/env elixir
defmodule Problem025 do
  defp fibonacci_sequence(), do: Stream.unfold([1, 0], fn [a, b] -> {a, [a+b, a]} end)

  def solve do
    fibonacci_sequence()
    |> Stream.with_index(1)
    |> Stream.drop_while(&(Enum.count(Integer.digits(elem(&1, 0))) < 1_000))
    |> Stream.map(&(elem(&1, 1)))
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem025.solve
