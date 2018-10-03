# Spiral primes

## [Problem Description](https://projecteuler.net/problem=58)

Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

    37 36 35 34 33 32 31
    38 17 16 15 14 13 30
    39 18  5  4  3 12 29
    40 19  6  1  2 11 28
    41 20  7  8  9 10 27
    42 21 22 23 24 25 26
    43 44 45 46 47 48 49

It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?

## Performance

[Try it online!](https://tio.run/##jVPLkuI4ELzzFRkx0bFmp5lGtnkt0d3nOexpjwQHYRegGVvySHJD/8Hub@6P9JZkwGZiD@MDSCpVVlZWqqjMt9bSx8d6DfzlpfVKH3BS/ggBqUu4RllZVeFUaq@KyhTfT8oRlIY/EvamqswpJsn3R0i4H620dMnrkJwqCRXpA68XUI6TbE3ll9F6PQp1w5ctkM2RzZDlyDJkKTLRB5cQC4g5xAwih@D4tA@uIJbADMh5A5EiXd2C@RRiBczB7SCFEEiXfZB3UzAlcD6jTJEu@iDjcJx/M6Q50hnSeR/MkOfIZ8jnyBfIl8hX126@@tCi0p4suSinN9DGE@slfRTNlOVFJ4dKEWRlwjWO7Iz3poZVh6NHqeTBaFk9Ytd6nEI2I9fG0h28crFuRF/C8FWzj2Csk27rHVmu8h4nGOtwjeMN2yFMq7GqpnUHoVwYo5VemQC0fGKYf//5G/P04Taxr3sYTShM3VTEnWk6oZLvZAPBk5VNQyUDm5YdFJhc3CB35o1@wSQrPqoq7GjglFjUHxm/saYg50KpwrAndUvl402eWG6AddHiviLDcoIqjjF26zXK4AYyxbq9VHtlncee34Njcux79szD62iUlLTXXfYrNuftCEgKyY/kPApuESHFUVyn8Lbtlgm9kX1/HXWW@pSwR5A8I7FU44yHMabj8SWYWKkPxMmJ0gWSP6U/Pu0rw110a/fDepzH3Xfl0/U6KYzVwQKboEpHzeiyY/DcSSXG@C0RXbE/iKkiqWXDlCZIfu@uhJ9x2D2A0Ytuf@N3@y5Ep8iHTKIyVyL832o/oDN5eUHyE9kIfwVP9qpiu18E7o8j0KBMGNQQfcIW2HZ0mXiK69kgJTymCdteT3iS2NzSLpRdW28jR3Y5Ng3ZgrSX3GDy1N/gCn3hvsa2k/gFg7TpFzEckKneCJteBMVdSn5On5LPrHM6huibDQP5Hx37C5bKtmAja4fPd2kTpUs684NMuOZGlWcoX2@x6bwUhOGz8Tie9hNNSmua4AysEZfR0Kcja3PtMTyvZ4i7jAk/q4rude0xvfxOw6big/p5GwVqrGZTBIF4@/HxHw)

```
Real time: 14.554 s
User time: 16.875 s
Sys. time: 0.586 s
CPU share: 119.97 %
Exit code: 0
```