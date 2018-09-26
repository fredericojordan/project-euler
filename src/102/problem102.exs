#!/usr/bin/env elixir
defmodule Problem102 do
  @moduledoc """
  Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

  Consider the following two triangles:

      A(-340,495), B(-153,-910), C(835,-947)

      X(-175,41), Y(-421,-714), Z(574,-645)

  It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

  Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

  NOTE: The first two examples in the file represent the triangles in the example given above.
  """

  defp read_triangles_file do
    {:ok, coordinates} = File.read("p102_triangles.txt")
    String.split(coordinates, "\n")
  end

  defp contains_origin(""), do: false

  defp contains_origin(coordinates) do
    [m, n, o] =
      coordinates
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(2)

    intersections = y_intersections(m, n, o)

    Enum.any?(intersections, &(&1 > 0)) and Enum.any?(intersections, &(&1 < 0))
  end

  defp y_intersections(m, n, o) do
    [
      y_intersection(m, n),
      y_intersection(m, o),
      y_intersection(n, o)
    ]
    |> Enum.reject(&is_nil/1)
  end

  defp y_intersection([x1,  _], [x2,  _]) when x1 > 0 and x2 > 0, do: nil
  defp y_intersection([x1,  _], [x2,  _]) when x1 < 0 and x2 < 0, do: nil
  defp y_intersection([x1,  _], [x2,  _]) when x1 == 0 and x2 == 0, do: raise "infinite intersections"
  defp y_intersection([x1, y1], [ _,  _]) when x1 == 0, do: y1
  defp y_intersection([ _,  _], [x2, y2]) when x2 == 0, do: y2
  defp y_intersection([ _, y1], [ _, y2]) when y1 == y2, do: y1

  defp y_intersection([x1, y1], [x2, y2]) do
    a = (y2-y1)/(x2-x1)
    y1 - a*x1
  end

  def solve do
    read_triangles_file()
    |> Enum.filter(&contains_origin/1)
    |> Enum.count()
  end
end

IO.puts Problem102.solve
