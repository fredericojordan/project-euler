# Problem Description

https://projecteuler.net/problem=15

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

![Grid Routes](p015.gif)

How many such routes are there through a 20×20 grid?

# Rationale

In order to get to the endpoint in a `n x n` grid, there must be `n` right moves and `n` down moves, to a total of `2n` moves. The different paths differ only because of their move order, not their move count.

For example, in a `2x2` grid there are the possible permutations:

    right, right,  down,  down
    right,  down, right,  down
    right,  down,  down, right
     down, right, right,  down
     down, right,  down, right
     down,  down, right, right
    

The total permutations of `2n` moves is `(2n)!` where `!` is the factorial operation.

But we must take into account that any right move is chosen from a pool of `n` identical right moves, and if any two right moves swap places, the path is the same. The same thing is true for the down moves.

The total possible ways of rearanging `n` right moves is `n!`. So we just divide the total number of permutations calculated earlier by this factor (twice to account for both the right and down moves), bringing us to our final form:

    f(x) = (2n)!/(n!)
    
Or, in Elixir:

```elixir
def factorial(1), do: 1
def factorial(x), do: x*factorial(x-1)
def grid_routes(x), do: factorial(2*x)/:math.pow(factorial(x), 2)
```

# Performance

[Try it online!](https://tio.run/##ZZDNCsIwEITveYoVL41o/8CLB@/iQd@gVLOtgZjIJtEcfPfaxgoBrzPzzbCLSgZJw7BcFN5ScZG6QP0EjDIT2N2N8ArhTOai8F5WWxCGAYzOA7r26gzJVmUVX4/6Dqp/K3B43VCDtI3UDnukSWq1gAB7KL9cWCXApuLs19OTFA0Z79BOWNyGpL1eBV5k6VraxHmMv/dwRNKockdeX7NJRS3mEbBGPTGbL0gH65KzmDuc8od3NvlCHiE2DB8)

```
Real time: 0.756 s
User time: 0.340 s
Sys. time: 0.312 s
CPU share: 86.35 %
Exit code: 0
```
