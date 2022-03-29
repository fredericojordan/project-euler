# Powers of Two

## [Problem Description](https://projecteuler.net/problem=686)

2^7 = 128 is the first power of two whose leading digits are "12".
The next power of two whose leading digits are "12" is 2^80.

Define p(L,n) to be the nth-smallest value of j such that the base 10 representation of 2^j begins with the digits of L.
So p(12,1) = 7 and p(12,2) = 80.

You are also given that p(123,45) = 12710.

Find p(123, 678910).

## Performance

```
________________________________________________________
Executed in  207.87 secs    fish           external
   usr time  195.26 secs    0.09 millis  195.26 secs
   sys time    5.23 secs    2.08 millis    5.23 secs
```
