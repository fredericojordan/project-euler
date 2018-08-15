# Combinatoric selections

## [Problem Description](https://projecteuler.net/problem=53)

There are exactly ten ways of selecting three from five, 12345:

    123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation, <sup>5</sup>C<sub>3</sub> = 10.

In general,

<sup>n</sup>C<sub>r</sub> = n! / r!(n−r)!

where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.

It is not until n = 23, that a value exceeds one-million: <sup>23</sup>C<sub>10</sub> = 1144066.

How many, not necessarily distinct, values of <sup>n</sup>C<sub>r</sub>, for 1 ≤ n ≤ 100, are greater than one-million?

## Performance

[Try it online!](https://tio.run/##bVPNbtswDD4vT8F0QGEXruKfpIdg7QYMA1bssAHbbRgK1aZTATJVyHKSout9u@6SF9ib5E36Ihkl5w9YDVgWSenjx480arVUdrN5PRx1rR3dKhohzQGDe1Bh3Ziq0whfrLnV2KSTAiozAHjX@ytTwsnJCTu@3aFFkPziUpZOP4BDgoV8aMHU0KLG0imagbuziFBb00Ct5phAlhfjyXTAEP5hy7vGfpnwUvhd4XdjXnJv5t7MvSmpAr7s714TlKZh@tIZq8o2gQVC1yLnQyDjpFOGEnicPL3/XvyAS8hSsb03Q0IrdeLNR@K45fgrGsII7DCi519/bDz0wUUo0cLz77/AWHziEmi9CkeyeL0SQqxXxXqVr1dZTy71R7I@kQPVeibQkVMaiCO@VncnHUiYS9156UrEihUjPG@U1sx5Co95waSyNLDOxuP04iIgfjQLaCQ9JAGVsMS2lVax8pVqWevSJT1s6MC2sgRqYyHrawhrlqZJ6NvMonRoPSM6ZvCWc/ke84fn4R5qbi9rLHWUxglPwxSy/0PLXUiIJfy8gg/UNcJi1ZUYnX5CS6jF2SiP96i77nHCNmJ17RbgAEnxKDpYNj47Cp3b@ADVN9ThzTFmP7YQyid4c87iC@Fr3w4ecGPZy3zp4GIC@z28QJGDSNU2MbRGz3GX50USURxirMdXx2o3olaaJY9Oo9MMriC7SdPUv/H@XNCtNDwz0S5byHj9Wdx3rj36L0VIP9hs/gE)

```
Real time: 0.670 s
User time: 0.509 s
Sys. time: 0.148 s
CPU share: 98.09 %
Exit code: 0
```