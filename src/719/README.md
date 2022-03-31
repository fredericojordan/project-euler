# Number Splitting

## [Problem Description](https://projecteuler.net/problem=719)

We define an S-number to be a natural number, n, that is a perfect square and its square root can be obtained by
splitting the decimal representation of n into 2 or more numbers then adding the numbers.

For example, 81 is an S-number because √81 = 8 + 1.

- 6724 is an S-number: √6724 = 6 + 72 + 4.
- 8281 is an S-number: √8281 = 8 + 2 + 81 = 82 + 8 + 1.
- 9801 is an S-number: √9801 = 98 + 0 + 1.

Further we define T(N) to be the sum of all S numbers n <= N . You are given T(10^4) = 41333.

Find T(10^12)

## Performance

```
________________________________________________________
Executed in  201.44 mins    fish           external
   usr time   41.78 mins    0.09 millis   41.78 mins
   sys time    0.38 mins    2.14 millis    0.38 mins
```
