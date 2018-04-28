#!/usr/bin/env elixir
defmodule Problem005 do
  def solve do
    Stream.iterate(2, &(&1+2))
    |> Stream.filter(&rem(&1, 2) == 0)
    |> Stream.filter(&rem(&1, 3) == 0)
    |> Stream.filter(&rem(&1, 4) == 0)
    |> Stream.filter(&rem(&1, 5) == 0)
    |> Stream.filter(&rem(&1, 6) == 0)
    |> Stream.filter(&rem(&1, 7) == 0)
    |> Stream.filter(&rem(&1, 8) == 0)
    |> Stream.filter(&rem(&1, 9) == 0)
    |> Stream.filter(&rem(&1, 10) == 0)
    |> Stream.filter(&rem(&1, 11) == 0)
    |> Stream.filter(&rem(&1, 12) == 0)
    |> Stream.filter(&rem(&1, 13) == 0)
    |> Stream.filter(&rem(&1, 14) == 0)
    |> Stream.filter(&rem(&1, 15) == 0)
    |> Stream.filter(&rem(&1, 16) == 0)
    |> Stream.filter(&rem(&1, 17) == 0)
    |> Stream.filter(&rem(&1, 18) == 0)
    |> Stream.filter(&rem(&1, 19) == 0)
    |> Stream.filter(&rem(&1, 20) == 0)
    |> Enum.take(1)
    |> List.first()
  end
end

IO.puts Problem005.solve
