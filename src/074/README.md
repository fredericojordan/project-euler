# Digit factorial chains

## [Problem Description](https://projecteuler.net/problem=74)

The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

    1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

    169 → 363601 → 1454 → 169
    871 → 45361 → 871
    872 → 45362 → 872

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

    69 → 363600 → 1454 → 169 → 363601 (→ 1454)
    78 → 45360 → 871 → 45361 (→ 871)
    540 → 145 (→ 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

## Performance

[Try it online!](https://tio.run/##fVXbbtswDH3PV7AdUDhr6thpkl6GtnvpsD6tWIcBQ1EEik0nQmXJk@XGxbbXfcA@cT@SUfIlt3YBbMkkdXgOKSkoeMn1cvlmr1/kuj/lso/yCdCZOzEmqYoLgXCr1VRgGpwMIVYdgPeVPVYR7O/vk@HLHEEW6RQ1hMMR8BwWKAQ8SrWQkCgNhgIyrTLU5pk@mHGWvEhBJW6asMgozZmwBm5yiPnMDgSF3wsyG2WhzzuUDSDcg0MY2tdoDy4gpMlgSK9wENjP4ciG3aKesywHgfkGH4IMx2c94LJiwo2lFhcR5o6KUHKGuYFoziiE6FTK8ipacPkIUxY9Okbjs3d2vSm0zEEVhtI26jQCo0dJYRVrtHKjOaGrrIbCkuemVgQWC/7@/gPH4@NxELopCRlWk/FZHXV6UrmGo@NxNSNL6xu0vkHtG1j4G2NFS2WoqknCo0IYy55UP2FF5frr9edvkBumDZezppcLTkXDJ5SGOkAyZmgopiDtVBjmpPjwgdqLJUszgb1Gy7qUYEfKukyvcXbrpSenrYag0bem2KtNTfho2OK3WF1L467RsuBmbgm1PWarziacCiCVPNKYIXPhBnWa92BamI3NsBlUAThk1laNktZ1m6JQC@o8QkoV5MrtuZyXdu9beN8S/EghKZPPFRil3IJ7FawHkZLGEqCyR4b6UkG/oOOK8tgTSgOd5mx1yryg26OzfA7hrit83VV2YTFHK2fCpcEZamtiMoYSLiGs1pXwdn3JUdjdzT9xx3tCF4AFcJcKQOnePy/hpsL2qzvA6zb2ayqJn7LMO2iB@uGm1yJaC8r4f1kndu@@lPrOaGSpz6l8zOBaotXa7ZQa7b6aLOZcoHf/0INEQtkDFkVwdFlvU57U5NH29MojZw9W6e3vx/mcCePW/aqNKHJc89u2V7iHh3BfPrRhpLUeN6VDrgRt8DpJ6PvhJAgC@2zJ3azpVpnW9K6HOz2RKqTZDUi4oAJ6B95BCBcXMA66myVzy9o@OcI3n/ysoAt/9V/jO/ad5fIf)

```
Real time: 56.409 s
User time: 55.669 s
Sys. time: 0.180 s
CPU share: 99.00 %
Exit code: 0
```