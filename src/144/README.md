# Investigating multiple reflections of a laser beam

## [Problem Description](https://projecteuler.net/problem=144)

In laser physics, a "white cell" is a mirror system that acts as a delay line for the laser beam. The beam enters the cell, bounces around on the mirrors, and eventually works its way back out.

The specific white cell we will be considering is an ellipse with the equation 4x² + y² = 100

The section corresponding to −0.01 ≤ x ≤ +0.01 at the top is missing, allowing the light to enter and exit through the hole.

![](https://projecteuler.net/project/images/p144_1.gif) ![](https://projecteuler.net/project/images/p144_2.gif)

The light beam in this problem starts at the point (0.0,10.1) just outside the white cell, and the beam first impacts the mirror at (1.4,-9.6).

Each time the laser beam hits the surface of the ellipse, it follows the usual law of reflection "angle of incidence equals angle of reflection." That is, both the incident and reflected beams make the same angle with the normal line at the point of incidence.

In the figure on the left, the red line shows the first two points of contact between the laser beam and the wall of the white cell; the blue line shows the line tangent to the ellipse at the point of incidence of the first bounce.

The slope m of the tangent line at any point (x,y) of the given ellipse is: m = −4x/y

The normal line is perpendicular to this tangent line at the point of incidence.

The animation on the right shows the first 10 reflections of the beam.

How many times does the beam hit the internal surface of the white cell before exiting?

## Performance

[Try it online!](https://tio.run/##lVdLjttGEN3PKcoy4JAaiRIJIUAmGdswYCBeJcBkNxgIJNWS2sOfu1sWCeQAyTZnyAl8BB/FF5m8/pGUIuezGIrdVV2fV6@qOazgLRdPT8@fLQ5SLDJeLVj1kZjZvtqwbVlvDgWjn0WdFayMVyva1FdEr@3@ps5pMplg411FRSqZoGbfSZ7LGaU0Oe65YpSzopgQl9gpuRC1INlJxUpS@1RRmitItHDDirSjgleMtlBSe@ZMZiwtI/oFa/1GrFJMSCPXpmeU1YcqZzAh8LKhujIy60sHgj32EacOaVF0dKzFoyQOr0e4y9L8keqDiq6QhHYhG5bzLc9pCJ6OjI4cvxnWdSX5hgle7UxKFbAqeCO1htobx@zDIVUcUazaz5/omjo8byleLnsXLDfyvBaCyaauNtqaqunLb38so2VMX37/k1rzvDZrwKQNq7rRPksuJQ4gsaKoj@aohorv9kobMfDYpFuuDwKVnY1sXxfMJPrs/iHYK9XIm8WiEfV7BMRQThFVTPmNBS/THZOLBkVfx9GOb8P/fy4x53ziNkZTRK6LhGQaSyySKhWaCDbTpuaVogDJz@JlFIf0/iCVLpPG3mgM1bEFVp4dWy6gysvGEGsggjYdxNFqNv8u@jY0KLxNc@DCS3bGNdpzd1QexDbNGdVbW1lb6hnYA4pq9K3aQYJaMHDUioJtC1fgSVrtCnOaVzkiB0sNOwpNHCcZ1KMJQEKUXGpKOzK5g8ok6XTZxoQJJqSPNnaZIglrsqdhVYtSR6X76QTWcTgGh3e2YbZ8dxDMt0/Btmpm3gT8GSty7xO2IKtjbU1KbROdoYA5QlNHxqpzTH2RjmCtx3Mo4ve2gMWBnbsyS4XcNAig96gOX0/LO7Bx2vkwdHhRN2CF1/G2PVBp1Xn@tbMu9Go7jhHSe@byBhZudceu2kXnTY8x1@RmomHo7vxQpMIGj91zh/9QGW0zrdBQhk6uMsJ00Xkx4uWIStJHbUantvRjfQRdkJrmu8QQZ3LomT1XjmwYHRUSOOP9aBRmDLOZmdGCyfMKlvX8xw/uisantjYQr1MFBKkLZ3B3Q/PV1CFlVE@wCcwBrxgvzLJX1UCt/VQN2hg28dcm@E1Cex@Rq@otBV0y7@JwEbTJvI1DI7s3Qn2M5lZx2sYPECGA3ouN2bHXZiCDEo7KxAWG1RyLRRBfl/EUb/rs6@EOnNNdi3n/BlF0ZnnpAnB7gVUNe9FYEpqX5K59o3VGKsHq@u7zp9ApJndvQm0lgMocCiH0lq4iJilP17UprLt2Ao9GxlP54FK7qDjSCz1K/6ro65EimBWCs3Dbgur9DPuJXU/1AbOZY1MvzA6Ac1hpn4XSlrJppvGcptPcCtpY13qewcMN2mMfyQ9CBUY9RIWSaWpL3yZOb/51PcsR88Sv5pfnyLXBaNaLkl6UjEXnVBK1ShWzHPLgmOnsiWT2ru0W6DS3Ru2a6Lkb5ZgVdupkHW6cb4bJ4dpl8Gcbf60bxfszneeL0V8ca9cmLqPL/eqEv748a9KR4GKzDFERVezofdFQfHP2BJ2zyML/qmZr1ntB2Khwv5y2fyuJh0jfSH0L6HR9C5xqjFG8bOMSzuOA9KvhCBD4aoFcHvd2qD3MLMe65EGfumwN0FxsQmeLbynNZNACDow/@oHwEYVPSBfgaYjOl5GwQrJLKjYwqwI8T1F1n6Kvgvv1KZgtvaS5/XbFvd/aMOyig2jpDVS1WvdGhvvLWXl2SeSck6yLj6wH3oXbI356ZyxnpL8j8cQHIJkvQIvWnRL6hsT1JkC2nhe9Giry4qTsC3eloApvq0MZKXyCrXE/Fix4MU7mXC/HN4gyHaTxMxi@@ylq8EU7@t8qMjldPT39BQ)

```
Real time: 0.393 s
User time: 0.328 s
Sys. time: 0.109 s
CPU share: 111.03 %
Exit code: 0
```