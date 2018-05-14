# Problem Description

https://projecteuler.net/problem=14

The following iterative sequence is defined for the set of positive integers:

- n → n/2 (n is even)
- n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

# Performance

[Try it online!](https://tio.run/##jZE9a8MwEIZ3/YorgSA3QZbaToF069Cp3UMwdnQlAn2ktuW6wf/dleQODgQSwQ169dxzcEKtelWP4@Ih902dV8rmaDvAFBOJX8ZJrxE@a1dpNFy8gHQEILzAwWldtueiwW@6O2IpYYC2VHqfwc8RLaRouwWxDj0bSMiQgDsFNRoa4zU8ZVHEJ9FFG0jVTVBghvmQfXZzzDXf82NEVuIOWX9N0Af0n22c7nDaF4BgTBSc81gpGF7hzXrDTNkX1S9d0nQ7OG9bOjcuRRZOaEErSSzy/sFOvm1mn8LSKDKOfw)

```
Real time: 8.741 s
User time: 8.470 s
Sys. time: 0.157 s
CPU share: 98.69 %
Exit code: 0
```