#!/usr/bin/env elixir
defmodule Problem050 do
  @moduledoc """
  The prime 41, can be written as the sum of six consecutive primes:

      41 = 2 + 3 + 5 + 7 + 11 + 13

  This is the longest sum of consecutive primes that adds to a prime below one-hundred.

  The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

  Which prime, below one-million, can be written as the sum of the most consecutive primes?
  """

  defp prime?(1), do: false
  defp prime?(2), do: true
  defp prime?(x), do: Enum.all?((2..round(:math.sqrt(x))), &(rem(x, &1) != 0))

  defp generate_sublist_prime_sums(list) do
    len = Enum.count(list)
    for a <- 0..len-21,
        do:
          a..len-1
          |> Stream.map(&({&1-a, Enum.sum(Enum.slice(list, a..&1))}))
          |> Stream.take_while(&(elem(&1,1) <= 1_000_000))
          |> Stream.filter(&(prime?(elem(&1,1))))
          |> Enum.to_list()
  end

  def solve do
    1..55_000  # at least 20 terms in the sum, the min can't be over 1_000_000/20
    |> Stream.filter(&prime?/1)
    |> Enum.to_list()
    |> generate_sublist_prime_sums()
    |> Enum.to_list()
    |> List.flatten()
    |> Enum.max_by(&(elem(&1,0)))
    |> elem(1)
  end
end

IO.puts Problem050.solve
