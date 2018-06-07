#!/usr/bin/env elixir
defmodule Problem033 do
  @moduledoc """
  The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

  We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

  There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

  If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
  """

  @empty MapSet.new

  defp empty?(some_map_set) when some_map_set == @empty, do: true
  defp empty?(%MapSet{}), do: false

  defp has_same_digit?([num, den]), do: !empty?(MapSet.intersection(MapSet.new(Integer.digits(num)), MapSet.new(Integer.digits(den))))

  defp matching_sub_unit_fractions do
    for den <- 10..99,
        num <- 10..den-1,
        has_same_digit?([num, den]) do
      [num, den]
    end
  end

  defp equals_cancelled?([num, den]) do
    culprit = MapSet.intersection(MapSet.new(Integer.digits(num)), MapSet.new(Integer.digits(den)))
    n = Integer.digits(num) |> MapSet.new() |> MapSet.difference(culprit) |> MapSet.to_list() |> List.first()
    d = Integer.digits(den) |> MapSet.new() |> MapSet.difference(culprit) |> MapSet.to_list() |> List.first()

    case [n,d] do
      [_,0] -> false
      [_,nil] -> false
      [nil,_] -> false
      _ -> num/den == n/d
    end
  end

  defp simplify_fraction([num,den]), do: div(den, num)  # FIXME: Lazy "hack"

  def solve do
    matching_sub_unit_fractions()
    |> Stream.filter(&equals_cancelled?/1)
    |> Stream.filter(&(rem(List.first(&1), 10) != 0))  # Removes trivial examples (e.g. 10/20)
    |> Enum.reduce(&([List.first(&1)*List.first(&2), List.last(&1)*List.last(&2)]))
    |> simplify_fraction()
  end
end

IO.puts Problem033.solve
