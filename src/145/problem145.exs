#!/usr/bin/env elixir
defmodule Problem145 do
  defp reverse_number(x) do
    x
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  defp is_reversible(x) do
    cond do
      List.last(Integer.digits(x)) == 0 -> false
      true ->
        x
        |> reverse_number()
        |> Kernel.+(x)
        |> Integer.digits()
        |> Enum.all?(fn(x) -> rem(x, 2) != 0 end)
    end
  end

  def solve do
    Stream.unfold(1, fn x -> {x, x + 1} end)
    |> Stream.take_while(&(&1 < 1_000_000_000))
    |> Stream.filter(&is_reversible(&1))
    |> Enum.count()
  end
end

IO.inspect Problem145.solve
