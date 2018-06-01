# Quadratic primes

## [Problem Description](https://projecteuler.net/problem=27)

Euler discovered the remarkable quadratic formula:

- n<sup>2</sup> + n + 41

It turns out that the formula will produce 40 primes for the consecutive integer values 0 ≤ n ≤ 39. However, when n = 40, 40<sup>2</sup> + 40 + 41 = 40(40+1) + 41 is divisible by 41, and certainly when n = 41, 41<sup>2</sup> + 41 + 41 is clearly divisible by 41.

The incredible formula n<sup>2</sup> − 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

- n<sup>2</sup>+an+b, where |a|<1000 and |b|≤1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |−4| = 4

Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.

## Performance

[Try it online!](https://tio.run/##fVXdbtMwFL7vUxyGVCVrmialWtm0DSQEYuICJLhDUDnJaWMtcTrbaTspDwC3PANPthcpx3bSdR3btDS1z8/3ne8cu1jwDZfb7csXo1rJUcLFCMUK0G73MpyXVVYXCF9klRRYRuMpZFUP4K3bz6oUjo6OaOM9rSRkXKXVCiVmoHMEiSWT14wi4aZmmWSapzCvZFkX7KxHUUMQP8cwAEHPJKYN@r/SoGspFFQ1fcuZtqnaKFjzooClJPQUYRLRV16iMmbrllZCYVprvkLgQuOCSK1YUZNLBHe//xKS@Xx1GsLHao1ENYB1joL2LyhdQI8lRJkNI7vpTaJB7Ls1V1TjiituakpuaSsAJjJIUWrGRXG7l41Mk9hli3fRaYFMkttBltDV/i03tFPSz5q6oo1Id7/@wPTUCBWfRDGsmdpT2xTB07wTRsHrZ5XpFCEpBD1TUsMgu2gN1byNwPmcpxyFVoHBn57aWg1@YGqhrXh8MqFwx/4dQfAMJReL@36rLp0p5sw52rYPmBgkVn2J0LDmPI6iyAI0SUOszNK5m7/WTTQG2KSzA1irEUtUVdS6LcqAiTYEw0UITRw31Iw4dpmJ8sSsJy7zBy7cpD5bOrOxxLXT8n6YcbOUqBSvhBvVXQMsRbbhZV2CqMuE5pBy7/XkP/0w3ANQmkltJFxznYO4iIy67pDReVxS/TObxtv4btg25zS3WXV2bxlu/Efeke@c5qxQ@MgaP2sdt1Yta3yaBlzC2N0OdB1QzSErijeeNw5DWdUi885KpvNQ3UhNMT6lnAtP@DC8NPeEtwmAFi8u6JyiyAx/evUcGixQIAmOs/3GeH6HZvRkcD6EoRmaMDSfQTsFAMmBpYsC@M4CSH7YhQF7AGmLm7XA1N9ZgWKhc8/F7KC/aomsDLm2/DzqRN/rx3Rf@NbcXHYeJVt6xnTcN5cBvRN6sUduml3jjA5zgV6/k3gU77ysrinJqb0DiegU0CS1rJ7Q60EWms5Zcuv1nyj0EJRuGRpsr/8JpcAiPB6NOwKWxNXncFlrtfdDEVpGve32Hw)

```
Real time: 55.706 s
User time: 53.869 s
Sys. time: 5.077 s
CPU share: 105.81 %
Exit code: 0
```