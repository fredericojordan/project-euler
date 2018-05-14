# Problem Description

https://projecteuler.net/problem=18

By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

       3
      7 4
     2 4 6
    8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

                                75
                              95  64
                            17  47  82
                          18  35  87  10
                        20  04  82  47  65
                      19  01  23  75  03  34
                    88  02  77  73  07  63  67
                  99  65  04  28  06  16  70  92
                41  41  26  56  83  40  80  70  33
              41  48  72  33  47  32  37  16  94  29
            53  71  44  65  25  43  91  52  97  51  14
          70  11  33  28  77  73  17  78  39  68  17  57
        91  71  52  38  17  14  91  43  58  50  27  29  48
      63  66  04  68  89  53  67  30  73  16  69  87  40  31
    04  62  98  27  23  09  70  98  73  93  38  53  60  04  23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

# Performance

[Try it online!](https://tio.run/##lVbbbuM2EH3PV8ymQGDDiiLqziw2aAts0QWKboHuWxAYskXbKiTRlehcivx7eoaU7GxrZ1vDtKjhOWcu1FBWdfVYdS8v37272vXd1aJqr1R7T8qaz0q1anS5qxX91ulFrZpA5FTqM6Lvnb3USzo/P4fhxyfqTdGZql1TYchsFBm9Jb1y064q2jV0FqrWD1S0JTX6nrFGU1H@USxVa6jdNQvV9aRbS@qAtHjP3jbFY9XsGjBMUdOq0431AIGFNgZ3VU9h5J8hGPuJhklGsZuFFFNqpzklJAHAzZcNoq16jyKaAToDZoa1D6PUTxVi/U/uj6Z6vQ/n5CdLvgGRCVEavwkSGVGMkYdvwLB3FEErB1AEJ4FhQBTErOU001PxCQmgACHiJDDHNToeZw7XAfQy6GWABayLa5odgUvJTl0QIRNT@MLIEJj8d4KxcCMEJMHIoRsDmgeOEkVnRwjQzUJedElGPM@cH8l@5VekhFNkWuxCCzFi2CRsCagS1ARz8Tp9di6E88F5jMnzZmW8F5xn7u6TQyFYMxt0o2FZxM7OPhPYEkiHGYfJqQxUW9DU1Y11c@kCTzm/YPCN9VS6Z4CLFAlLthTOIx90eY/kUPLcUWXk4rGSwzMS2h769fOXj9f0Q8/Pf6eowNBt/QRnUR6jjXdGocEq7jPa6r6vcJRw4/S6vsdkw2Z3vtDiCQ30xAeDulfdkyP79LN@4HtvPIeQk8dq3HB90Shaboq6Vu1a0UNlNlQc2nCpW1NULUvqVl1udm3ZqZIPl/49x7Qs2lYbdKsLp@QQFh280kp3S@XZw6pTf@6qTvUQXtYcCTXKbHT5jt7rKSrAZyCfinuvt7ast1ly57mZTDw08XgnEH6MkYd7S44jCJgcVhGM1jDwUGfGOXy61xMSK8LDDnhoPsxxjfb6OdQCcDJwMqwEzMU1zfbxSFZz6iGjU/jFyOBR7qOK4YFHiJUEI4dGDEQeOGQUfYWEThay1UUb8TxzupL9yBGdcNTMiF0UIUYMm4QtAUuClWAu9hmxNyGcNsc7ZsaVzLh2nE/u7pNDlsL5Yc1oWBWx88P@EtgSKIcZR8cZjExbrdTVh3VzrCa2glAKBt9YT6XbM65KJEa2ZXEe@aDNeyCH6uaOLSMXk1Ud9jl09bzjhwkv3y2tlZmPD9V8W5jNvN81k9s7j@b2WyyXUw@v5GuefYO0UUVJz4RuqMG/NfPRMB9M6E2n6N7xhN7oFVnUYEDX0@XNCQes4g1qB7HZR7zW/cJMnD@7MJ0OauJ/qM3ESb2ZGBRVW56Nv2@UAu909TjU7Q2ER9ZXX1dLNdn3Nvbd9y8F6Ni0X6re@Kuq683k1XSPnSKuMZRtUc5rtTJzPqHmf6lO95MaHI9wcO1LXq2c06XetcauT@nmA0MOe8BWl27dq8F2TP02eGbonfPwjwK5sIYzeJAOfB8HbltOrhsUwt/qh0novY7nkBgKgK9lPd/Q76ZTReM3xXZyMfnUGrVWnV9W68r0kws@P6bT49hjYTPhlM8TMsc38eI13iriT9xkOhTAFuHTZ3@7M/2r/7e@rcjZy8vf)

```
Real time: 0.566 s
User time: 0.430 s
Sys. time: 0.158 s
CPU share: 103.93 %
Exit code: 0
```