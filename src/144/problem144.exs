#!/usr/bin/env elixir
defmodule Problem144 do
  @moduledoc """
  In laser physics, a "white cell" is a mirror system that acts as a delay line for the laser beam. The beam enters the cell, bounces around on the mirrors, and eventually works its way back out.

  The specific white cell we will be considering is an ellipse with the equation 4x² + y² = 100

  The section corresponding to −0.01 ≤ x ≤ +0.01 at the top is missing, allowing the light to enter and exit through the hole.

  ![](https://projecteuler.net/project/images/p144_1.gif) ![](https://projecteuler.net/project/images/p144_2.gif)

  The light beam in this problem starts at the point (0.0,10.1) just outside the white cell, and the beam first impacts the mirror at (1.4,-9.6).

  Each time the laser beam hits the surface of the ellipse, it follows the usual law of reflection "angle of incidence equals angle of reflection." That is, both the incident and reflected beams make the same angle with the normal line at the point of incidence.

  In the figure on the left, the red line shows the first two points of contact between the laser beam and the wall of the white cell; the blue line shows the line tangent to the ellipse at the point of incidence of the first bounce.

  The slope m of the tangent line at any point (x,y) of the given ellipse is: m = −4x/y

  The normal line is perpendicular to this tangent line at the point of incidence.

  The animation on the right shows the first 10 reflections of the beam.

  How many times does the beam hit the internal surface of the white cell before exiting?
  """

  defp tangent_slope_at(x, y), do: -4*x/y

  defp perpendicular(slope), do: -1/slope

  defp line_equation(x1, y1, x2, y2) do
    slope = (y2-y1)/(x2-x1)
    [slope, y1 - slope*x1]
  end

  defp slope_between_slopes(m1, m2), do: (m1-m2)/(1+m1*m2)
#  defp angle_between_slopes(m1, m2), do: slope_between_slopes(m1, m2) |> :math.atan()

  @doc """
  - Sx + B = y
  - 4x² + y² = 100

  4x² + (Sx + B)² = 100
  4x² + (Sx)² + 2SxB + B² = 100
  (4+S²)x² + (2SB)x + (B²-100) = 0
  """
  def ellipse_intersection([slope, bias]), do: ellipse_intersection(slope, bias)
  defp ellipse_intersection(slope, bias) do
    a = 4 + slope*slope
    b = 2*slope*bias
    c = bias*bias - 100

    delta = b*b - 4*a*c

    x1 = (-b + :math.sqrt(delta))/(2*a)
    x2 = (-b - :math.sqrt(delta))/(2*a)

    [
      [x1, slope*x1+bias],
      [x2, slope*x2+bias],
    ]
  end

  defp rotate_slope(slope, angle), do: (slope+angle)/(1-slope*angle)

  defp reflect_line(slope, x, y) do
    reflected_slope =
      tangent_slope_at(x, y)
      |> perpendicular()
      |> slope_between_slopes(slope)
      |> Kernel.*(2)

    new_slope = rotate_slope(slope, reflected_slope)

    [new_slope, y - new_slope*x]
  end

  def solve do
    [slope, _bias] = line_equation(0, 10.1, 1.4, -9.6)

    [new_slope, new_bias] = reflect_line(slope, 1.4, -9.6)

    [point1, [x, y]] = [new_slope, new_bias] |> ellipse_intersection() |> IO.inspect()

    reflect_line(new_slope, x, y) |> ellipse_intersection() |> IO.inspect()
  end
end

#IO.puts Problem144.solve
Problem144.solve
