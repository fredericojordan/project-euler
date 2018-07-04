#!/usr/bin/env elixir
defmodule Problem042 do
  @moduledoc """
  The nth term of the sequence of triangle numbers is given by, t[n] = ½n(n+1); so the first ten triangle numbers are:

      1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

  By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value is a triangle number then we shall call the word a triangle word.

  Using [words.txt](https://projecteuler.net/project/resources/p042_words.txt) (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
  """

  defp read_words_file() do
    {:ok, words} = File.read("p042_words.txt")
    words
    |> String.replace("\"", "")
    |> String.split(",")
  end

  defp get_word_value(word) do
    word
    |> String.to_charlist()
    |> Enum.map(&(&1-64))
    |> Enum.sum()
  end

  defp triangle_number?(num) do
    n = trunc(:math.sqrt(2*num))
    n*(n+1) == 2*num
  end

  def solve do
    read_words_file()
    |> Stream.map(&get_word_value/1)
    |> Stream.filter(&triangle_number?/1)
    |> Enum.count()
  end
end

IO.puts Problem042.solve
