# Quadratic primes

## [Problem Description](https://projecteuler.net/problem=27)

Euler discovered the remarkable quadratic formula:

- n<sup>2</sup> + n + 41

It turns out that the formula will produce 40 primes for the consecutive integer values 0 ≤ n ≤ 39. However, when n = 40, 40<sup>2</sup> + 40 + 41 = 40(40+1) + 41 is divisible by 41, and certainly when n = 41, 41<sup>2</sup> + 41 + 41 is clearly divisible by 41.

The incredible formula n<sup>2</sup> − 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

- n<sup>2</sup> + an + b, where |a| < 1000 and |b| ≤ 1000

    Where |n| is the modulus/absolute value of n
    (e.g. |11| = 11 and |−4| = 4)

Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.

## Performance

[Try it online!](https://tio.run/##fVXdbtMwFL7fUxyGVCVb6ial2ui0DSQEYuICJLhDUDnJaWvNcTrbaTspDwC3PANPthcpx07SdR1b1fz4/H7nO8cOSrEWerN5@WJQGT1IhRqgWgJ68UGO06LMK4nwRZepxCIenkJeHgC8beR5mcHh4SEJ3tNKQy5MVi5RYw52jqCx4PqakyfcVDzX3IoMpqUuKsnPyIn@fVA/h3AMiq5R0siuLNhKKwNlRW9zbn2w1g9WQkpYaMqfIYxiehUFGqf2ZlmpDGaVFUsEoSzOCNaSy4pMYrj7/ZcyufurMYOP5QoJbASrOSqSX1C4iC4PiCI7RF4YjOLjJGzWwlCVS2GEqyq9JVEEXOWQobZcKHm7E41Uo6SJlmy9M4lck9leFNbU/m3uYGfEoFd1RTuS7n79gdOxIyo5iRNYcbPDtytCZPOOGAOvn2WmY4SoUHSdEhsuc@NtoZy2HjidikygsiZy@U/HvlaXP3K1kCgZnozIvUH/jlKIHLVQs/uOmy6cK2av7dyVk/oOaISa13AOSRzHPk2d1r5XTtC4uV9rqmoHwIX1o1iZAU9NKSvbFueSqtYF2YxBnSQ1NSVJmtgEfeTWoybyB6GamX2WAu59CW/H6f1Y43qh0RhRqmZkt43wEPlaFFUBqipSmkeKvdOb//TFYY/AWK6to3Il7BzURexYdtuNHrQ1F0TAxMcJ1mEzdetzGuC8PLvX9NfhI@s4bIymXBp8pE2e1Q5brdUVPg0DLmHYHBR0MlDRjEv5JgiGjOmyUnlwVnA7Z@ZGW/IJKeRUBSqE/qU7MoJ1BLR4cUEbFlXu8NOjLRpmqJAYx8luZ4Kwy@YI5XDeh/54PGaMblE7BACpl7tpYswPWesD8J1HkP7wC5fqQUJf2qRNS@2dSFQzOw8an23ir1YjL5iwHl1AfegFvYSOjdCr68vOouCLwKmOeu5MoCd3W@CRmeXXOKE9LTHodQQPkq2VZzUjMm2wRxBtAhqkFtUTbD2IQsM5SW@D3hOF7ielw4bmOuh9Qq1QsqPBsAPgQVx9ZovKmp0vBvOIDjabfw)

```
Real time: 55.706 s
User time: 53.869 s
Sys. time: 5.077 s
CPU share: 105.81 %
Exit code: 0
```