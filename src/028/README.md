# Problem Description

https://projecteuler.net/problem=28

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

    21 22 23 24 25
    20  7  8  9 10
    19  6  1  2 11
    18  5  4  3 12
    17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

# Rationale

With the intention of making a recursive function, we must define both a stopping condition and a rule to recursively call the function.

Let's start looking at the simplest case `f(1)`, a spiral with side length 1.

    1

This is a trivial case, and our function `f()` is now defined for `f(1) = 1`.

Let's analyze our next case, `f(2)`:

    1  2
    3  4

This data point defines `f(2) = 10`.

Going forward, let's look at `f(3)`:

    7  8  9
    6  1  2
    5  4  3

Now we can apply recursion! Yay! 🎉

We can see that if we isolate the outer ring of `f(3)`, the remaining numbers form the spiral of `f(1)`:

    7  8  9
    6     2    --->     1
    5  4  3

So our function for `f(3)` now becomes `f(3) = f(1) + <extras>`. Let's take a closer look at what are these `<extras>`:

    7  8  9
    6     2
    5  4  3

For a spiral of size 3, one of the corners is always going to be 3<sup>2</sup> = 9, regardless of the direction the spiral is going.

Let's for a moment imagine that all corners are equal to n<sup>2</sup>. In that case, our generalizing function would have the form:

`f(n) = f(n-2) + <extras> = f(n-2) + 4*n*n`

We know that this is not true, and we are overestimating the value by some terms. Let's take a closer look at what these terms are.

In the case of `f(3)`, the next smaller corner number is 7. This number differs from n<sup>2</sup> by `n-1`. The next smallest number is 5, with a difference of 2 times the term `n-1`. The last number has a difference of 3 times that same term. If we add them all up, we come to the final form:

`f(n) = f(n-2) + 4*n*n - 6*(n-1)`

# Performance

[Try it online!](https://tio.run/##dY/NDoIwEITvfYo1XigKFGKM8eDdk74BgXTVJqUlLcW@feUnJCaEw17mm52dRSm8MCHsd5mzJquFylD1gJNMOL4azZ1EeBpdS2xYcQGuCcBAwLbCVLLkonqX1jVRTo8DvEK@wYuFsw2Dp/D9oAJhS6E6fKMZpUpx8HADNm@fYh97SOAcRz7JKRzWMUlByXJCyx7nyrAuzFhOB4KKk3HI/ZG2rrN/36ZTAAnhBw)

```
Real time: 0.375 s
User time: 0.308 s
Sys. time: 0.116 s
CPU share: 113.20 %
Exit code: 0
```
