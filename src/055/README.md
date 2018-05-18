# Lychrel numbers

## [Problem Description](https://projecteuler.net/problem=55)

If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

Not all numbers produce palindromes so quickly. For example,

349 + 943 = 1292,
1292 + 2921 = 4213
4213 + 3124 = 7337

That is, 349 took three iterations to arrive at a palindrome.

Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome. A number that never forms a palindrome through the reverse and add process is called a Lychrel number. Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel until proven otherwise. In addition you are given that for every number below ten-thousand, it will either (i) become a palindrome in less than fifty iterations, or, (ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome. In fact, 10677 is the first number to be shown to require over fifty iterations before producing a palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).

Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.

How many Lychrel numbers are there below ten-thousand?

NOTE: Wording was modified slightly on 24 April 2007 to emphasise the theoretical nature of Lychrel numbers.

## Performance

[Try it online!](https://tio.run/##hVVdb@tEEH2mv2IoEkqE68aJmzRFvZdKXEQF4iLdK/FYufY4WXW9G3bX@RDw28uZdZLrpBI8xJuM5@PMOTMb1mqr3OvrN19ft95dPytzzWZNHM0XFdeNrVrN9Luzz5qb0XhClb0g@qGzV7aky8tLGB5r2jCF4oUpnyXkeM3OMxWmoqKqEhjpO5rldE/ZOEtos1TlkpSnVaGVqZxtVJleIM9vNlChNZm2eUYGWjkUKvmLH3vylv5sVfmidyn9ZB3xtmhWmhOJn@RzFJrnk1hpPk5gkxNGPDNY83E2gVEOGCfZWEDNJpOZhH9eFgGwkpgnWPtCYemYSQV2RVDWeFipcE6t0Ryg9oBF/A86LG27WJKxZA3Tsog9rLlCDtpxSORE451bwIk0HuGHlhPSCixm82lCRmg8cnBSjB72AV2GzrO2rvEnfoI/4glLPldFEpfsvcApQTowFvTrrkTHBwFS@rFlaVnC8bGOg4IvmSK0jsnWYvU98JIbMGLAqnUr6/deKhIhU5TIqPilyFx430aQkct9Q/A8oGhNULoj0JBFTrdRHs0/GmlAiSK0sy0UYVoocYqpBID0ujukfGZtNxTYXAnvHiCjDhsFDKwkLw3UEG6lcHZCoDKkhSQkNlSrOux605CQdQlCEdsJjt6QLo6wMIB0qzYos6CV3Ry04q3yAaEyG01higWIx0zXhROmm2Il0GTMTvRGy3VRYn6y0XQ260aIAcj5cJwEiw7ArN0Y@e4YayIixdE4Qw5PsMT74RKE/XJ3lE@nt7NJdjPHmY/H@e10Or/JJjOcOQ1uJickjG@vKrVQwQ/jEnyC7k55JNW7RGCijijUW/bjgnfSuzhdjWe9Zn82g/77Xqf7XZf28/k8j@V@hrTgcXced0iL51v938fb5uPnD3f0h3WVELARPWylaiWCaIX11DuISrgiHtCQpvFoNBNmuVlBPEzif@zFGZgU5bqrErfq6rCKT93bwXbY3atfbfEg@vsd5A68wAIG@@SDA7zB8PDqU/yd7lO8sSNCdcHxFZsKz/O6WDsUTVD1jra4B9/g6cUo//RlMnpR9/f/F7bn4LxLEqhcNGlraqurwTmo2pChq3f0l0lOAJvhP9JOv2HJIv86g5vR0fwB5VLMw/vBtyfQr7Ojyy/sDOvU2HDGEBYRI3iAmaVpNnoajUZnFWulMf0x/WmLvRIRRWlxgx1lkM/F48cUV4Lv/aWmsebF6@u/)

```
Real time: 0.630 s
User time: 0.572 s
Sys. time: 0.088 s
CPU share: 104.79 %
Exit code: 0
```