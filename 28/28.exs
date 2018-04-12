defmodule P28 do
  def spiral_diag_sum(1), do: 1
  def spiral_diag_sum(2), do: 10
  def spiral_diag_sum(x) when is_integer(x) and x > 0, do: 4*x*x - 6*(x-1) + spiral_diag_sum(x-2)
end

IO.puts ["1: ", Kernel.inspect(P28.spiral_diag_sum(1))]
IO.puts ["2: ", Kernel.inspect(P28.spiral_diag_sum(2))]
IO.puts ["3: ", Kernel.inspect(P28.spiral_diag_sum(3))]
IO.puts ["4: ", Kernel.inspect(P28.spiral_diag_sum(4))]
IO.puts ["5: ", Kernel.inspect(P28.spiral_diag_sum(5))]
IO.puts ["1001: ", Kernel.inspect(P28.spiral_diag_sum(1001))]
