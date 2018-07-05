# Sub-string divisibility

## [Problem Description](https://projecteuler.net/problem=43)

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d<sub>1</sub> be the 1<sup>st</sup> digit, d<sub>2</sub> be the 2<sup>nd</sup> digit, and so on. In this way, we note the following:

- d<sub>2</sub>d<sub>3</sub>d<sub>4</sub>=406 is divisible by 2
- d<sub>3</sub>d<sub>4</sub>d<sub>5</sub>=063 is divisible by 3
- d<sub>4</sub>d<sub>5</sub>d<sub>6</sub>=635 is divisible by 5
- d<sub>5</sub>d<sub>6</sub>d<sub>7</sub>=357 is divisible by 7
- d<sub>6</sub>d<sub>7</sub>d<sub>8</sub>=572 is divisible by 11
- d<sub>7</sub>d<sub>8</sub>d<sub>9</sub>=728 is divisible by 13
- d<sub>8</sub>d<sub>9</sub>d<sub>10</sub>=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.

## Performance

[Try it online!](https://tio.run/##nZTditswEIXv8xTTLSwOOEpsx3Gy1G1vWlgotNDeGbPIkbIRyJaR5N0N9N3TkeVkf9xeNIEQM/50ZubMRFyKJ6GPx/fv5p3R80o0c948AO/DE8Z3tWKd5PBDq0ryerFMgKkJwGcfZ2oLV1dXGPi159B0dcV1CNFysUrSLF5vQhAGKCzAKthASxsm7oWlckCh4lvaGQ7COrCmjEPXgtoBp9u9@7Uo258xJxHRgFE1B6WZy1V11p2m0ijYU5dMUzykkbNcc2NFcw@mq2bGavfIxIMwohJS2AO0WrVc2wOZYAffuAVWRCUW1aeNjPWpQwzH53DcsFMY28FaQDUEbht8iS080kMIj2iFsh7fKSnVI2a@cTlmvRQrEvwuyxx9cn0PNaHN1QHiAfMIK9IyRzdHWDJgHmHFqszR8xGWDphHWJGVOU5mhGUD5hFWrMsc5zfComjgPMOKTZnjmMfcqTrPoKuLMsd1GIOZc@WrQCOdWaar3dCplP9cGbRY2L03@3l80G8h/uDGtoDBurPU8qAopzg9dQNFUZbj11IYO/ULDTgpDU/wYQYuGvYh9zm40OsjMJtB8YTSZwhTnJ8B3/0@uGy8YeeacAX9Bt6dDfgUYEt3r2rQvA5ucXHvuSad79wEXxAjRootPx/A/xghyRSbi6eQ5@gW@vSfCjEhS6eQXKyQEJI6hfRihSUhK6eQXayQEpI5hSi6WGJFyLqXuNyJjJBNLzE08mr4eEfIB34a8YvljMI4TMJlmIarMAvX4SZclNMe@v0RflrNaU12QuI9Flz/bX/m0Vu6pm1w/bbkF5gvvquD6VBhX@Xtd9J2eMM@X/KkL3lyPP4B)

```
Real time: 15.714 s
User time: 10.214 s
Sys. time: 4.926 s
CPU share: 96.35 %
Exit code: 0
```