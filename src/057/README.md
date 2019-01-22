# Square root convergents

## [Problem Description](https://projecteuler.net/problem=57)

It is possible to show that the square root of two can be expressed as an infinite continued fraction.

√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

By expanding this for the first four iterations, we get:

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

## Performance

[Try it online!](https://tio.run/##lVRLbtswEN37FNMUCKSEkSz5FwdoWhTowqsWaPcGJY5tohapkpTtIPW@Z@jxehF3KNmy4zQBuqGkmTfz3nwoXMqNNLvd2zdxZU2cSRWjWgHW5o7AWaFFtUT4YnS2xKI7GIHQHYAPjV3oHC4uLsgwcSAtlNpaSUBwGuxCr8EtuKMDwf6ouEEwWjvQM3BrDTlXkCHgpjRoLQrgFsgk1Uwq6RByrZxUFTlmhudOahV1iOnPr9@QwjtI4BqSOEifPaIogjAMPSTqJ/006ZHFR3588GRcCanmJIr0zrSp1c2ksY6@KgPEbLgnswzWCHN0dz62YfO8vfpMokFr3ZOnnnIUDxric28LqoWN4iTdCxwOh14fvFxQHeXD@vQ23of1RuN9Wd@oAIUb32eD2JRofQHgOz4ex6Mug7Q3jpPhmFGHBQxGo7jfvWWQVc10UM4XbnEMZZD0xr14fDtgfqzHFuGGFyXNd71Ayu3tqioyNH6mQs6lszS/g903khqMmxxR2FfRApUupPL4uqaJOiHVCm/cQlfWaz@Wx8BvWMHVQ7sgtl4aTkn5iYC1pNoKTYL3pLSV6pTyPTH6NaYHrXwJ81wEnHVDRst@BzyzAQ@f@rK9z39lDAwWtTFsUyzz4gQm5Cqo01x5yyHFEW2rYtrWEDyqhIlky@BRpUyk27C5c@CT0vR9akGItI4HQiVXgWcgB8XRplyDSk9MtD3MR20Jjkq0rFKt0LiWmHiZ2O4VPwqmti2ypOs/9TcjODTlTHHKar0JLdo2fB5lHZavBZ4reRp5QzUde0U3clo2v6Npe1lfYUj@kwGsXq7w0PKvziAvooYIAyrwMrhMrglfu3/eHxAFL4PLf2qLk3Os498p1bTb7baeT7SuUa4r5YKZgnoScHMPS1RztwgmyuEcTdTsb6Boxi/5BPloyOFh1vUx@RxJZUvM3cmfPKoL7ex2fwE)

```
Real time: 1.271 s
User time: 1.163 s
Sys. time: 0.152 s
CPU share: 103.51 %
Exit code: 0
```