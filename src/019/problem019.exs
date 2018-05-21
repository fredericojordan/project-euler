#!/usr/bin/env elixir
defmodule Problem019 do
  @moduledoc """
  You are given the following information, but you may prefer to do some research for yourself.

  - 1 Jan 1900 was a Monday.
  - Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
  - A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

  How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
  """

  def is_leap_year(year) when rem(year, 400) == 0, do: true
  def is_leap_year(year) when rem(year, 100) == 0, do: false
  def is_leap_year(year) when rem(year, 4) == 0, do: true
  def is_leap_year(_), do: false

  def get_monthly_deltas(year) do
    if is_leap_year(year) do
      [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else
      [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  end

  def calculate_month_first_day([[], [_|month_tail]]), do: month_tail  # Last calculated value is for the next year, don't return it
  def calculate_month_first_day([[delta_head|delta_tail], [month_head|month_tail]]) do
    calculate_month_first_day([delta_tail, [rem(delta_head+month_head, 7) | [month_head|month_tail]]])
  end

  def solve do
    Stream.unfold([1901, 2], fn [year, weekday] -> {[year, weekday],
                                                    [year+1, rem(weekday+Enum.sum(get_monthly_deltas(year)), 7)]} end)
    |> Stream.take_while(fn [year, _] -> year <= 2000 end)
    |> Stream.map(fn [year, weekday] -> [get_monthly_deltas(year), [weekday]]  end)
    |> Stream.map(&calculate_month_first_day/1)
    |> Stream.map(&(Enum.count(&1, fn(x) -> x == 0 end)))
    |> Enum.sum()
  end
end

IO.puts Problem019.solve
