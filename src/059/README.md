# XOR decryption

## [Problem Description](https://projecteuler.net/problem=59)

Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

## Performance

[Try it online!](https://tio.run/##jVhrb@O4Ff0@v4J1gVm7YB1Tsl7T2cxmF1MgwAJbdHaB9lNA27RNRJZcUUom2/a3T@@DkmglmWkSWDLJ@zr33EsyprSfbfPlyx//cNW55mpjqytTPQhDw292Zn@qd11pxN@aelOa0yopxK5@I8QPPL6rt2I2m8HAR709iu1RN3rbmkbUldBiW5/OHX6zTmjn7KEyOxjuKvuvzsDszghd7UR7NOLcmL1pGph3LYzpZodCN59@ur0V85uTaexWV@JTP/cTyu7rRtxW8HnSrQWDtxXYAheqg1ksxV9h1nzWp3NppOjOZ5jSzogb8b1IEwn@wGLr7sX8TwsYWkeSfCnrR7/wHkbVKltCbDcCojVNJUy1bZ7OZOxk2mNNTra1aPU9hCJa87kVe4sGt3X1YJqWYts8tYaWUTgSxyrxj1/@LgxihrPi0bZHUHCwDzD1oMsOVKDSSuyb@gQzzmwb04p787QUv4JOvXvQVasPXhTNoMZ9V23JPfTrqFvROVsdaNrpkwkDAFWYJZza2vMRsoTuS9EY19YNOoxpKbWtaOIvBPcAaJqQvXXEKPmg4G0cThPEDtPQVZvG6HsNDAo8IBlyw7rRw9JUB8Riah8Adw7ilQNlvORJAxW6s6j3ooEpQIvwZpg6B3E91l25g@XmTHLeA6CaVzlonKADlnd2D7Q0VQvE2BLLHDuAqNddKzY1ODs76vLBuJkUtkWX7OlcA90xXMj6zpBWsuAtIjC/IXPbrtKtKZ8QC4xlIBWowEoC1pcE/Kl2LUUD9l3NumrwzlIYARVhDdDlDOX2WEOhAI6aWXO7Z0T7GVjujuABJh5qJnRPisejBWrCktLee/cGwBtzNhrh2z5tS3SwfILppu4OhEgYJuVgo0tdbblcJ1EyO4Hd3X5vtxZwBl1lDWODm2gUJaEAusa24MoGjJDnkC80ilFv0OapbpBiCO4/6w6MaSjvIyCwMcBN4onR7kn25JqkG0rWWdc6ZBLEYww3A0HdYOhsQKzfyGsummUL1Jw39nBsBaJxT@z47pN@MOJnW91f/aqbAxTujVsul98twDY1CDTWArX74hw5yS0Pe6MLqF7Vj9BsgapU1NPK6IAbXiH23BME9LE6lNYdBWIIil7gICnfW2/BdSeO23gPqAk5rAEcqyFCWwEX0SACjE0fHsi2H237aJ3Brz8M7fOuNC2iRbmrxPs/iw96ufzwO7hSvxPv38PYu3eia/e5uL5GUdhqziMMd97J@YK3GzCYFTIppIpkJOE1TmQuI/hbwfdYpjl8LfCxTuQKV8GXjL7LTCYyimWUSSUjhcJ5IrO8f1EyzqVa4Qsu8fpTeMBwDHoUP3LUpgqJamBtkkpF@uATJlJwIkJZtQb78Qp1gGaFimIUAwswGOP4es02FJlhvSm8wodKhuBAbxahJdAIwiTZexdIxpEcNecpxVOwi9EaI2dXMAJ8kglQB5IJq0X1@EbP2MupmEN9ZiALDaA7PmaFgDEUMJIw1DDJBlMffuBA1IcSo4uwI2OuFOZuKhGiGI1ZSOgxYsIRUCjpGlOZ5n1YgIK3kHMCaNgHQbiDC7A2l2qaFwQFn@gRmKP0JCiqRjrEHuQ80ErcURlFSqDGOLDC5WlPNcYQLBNmBf6hB6rHmnk2Rkj6c/zKkSMkHqkoRCZC6kbISKZTmHTKN@YlIktYPvkLPPuWBBUWC6Ak/mY@qxxTlDOMlEXwxYPkMYXoszXBVIQUUyQGEHL2xlKeupSRkpXPVOzxyOMLZKngleLucElKtMGqyDNkTd5TZqjwacbyQG@EdrOvKcZPzgCvSzzB1kPGfZcBXQkN5GwWkwmPgFdUWxE1CQybrSDSDOELWEW8ELse9qVpM0BHvhZtEb3SbNDF3He35KJVXFBDYTW@jiVRrIgn7A6xS2WfxNSXT9CaEQ5FnHqmOfH@qoQdwBxwdbFf6jInvZ8v5jCbwhbL/LKR0RaSIZZDJ1m9EHu09jtFPLbRhDppQVtPnwtyLWXfoZr6anlFz4VrVGlKBvSM1KWWsH@FpQTvKx81tzSoFhgpMHzPe0wubWpkJl7JKOTYkC550Y0z5nYQb0rx9k2RG0fqnyHZFfnn0xX0pLHrpn0N5ENoTBJCn1sjermiFqHGZGbP98WxFFL0PcOCUcNuxhVWrP3GCkWG3hdh/pOhxQSsxZpgtvWNcQxTrabRPLf7LGP9qQdDTS7yTNFGk52hd873F8aAE772XpB/vHsHp6fLzR6ytqb9Mu837cJvFNFoOfLq8Cgk02KsalzWb6L8UvD2ziqw7mIMnLKVEmNi7pQpReTPH5Hym6jKfYEMB5XCb3UeryjlQvCq0SwfLpgtTC4@AXpi8AYWFMXQbpD0E0fWVBdDL6E1yqdzOLERVQpyIYmmnWByZiRIh0IhemT9kWU12ZEZxYQj94SIin7H8MtXyOueGSzPRwqOiYN79QiKCziIwjeTAh3CikpQVRyeg8mq38WC8xC57M@Okc@YP50MtuNsXJ/2bYgs9App3xqaRNAcYjYMSYE2lE76Y06/fI4a99Fw40AWxH46XYWsUM@OGLE/1Q6n1Sye0UXkP9fiU9vAxW3pzqVt5zM5W/QTH6vutDzp8/ytX9LWd7ZqzcE0V2pYBYOOpuc4ZKrdcP/5XDfzf2u44v53wRclf7dabnAGJxbDWuvu/K3O7Ob@uuSlvHF/JXQf5sO9fka3vtmoxasYV8BN2Gvxl7HLqelV7XK2v6z5wTu8NcM1tBXfixGQfnBw@g3JgPwE33DtIpgz@rTE/z2Y@SXwv9vzfGr5hdQAlP9XMg6mMo1uzR145saLKF5oNV5on192JS3An823Fmy/tQAyMLwLNHiNSq/F9sJL4erywfSuPbs@A@4vXKkZ70l4X8fXjxJ@854zz1RL8VYtFlOhvS0htPnbkLBBAigx@L/O@Tj2M2QO5JpJ4l8lBelw3WnIISF0@8vy3LUu@N/1kuB68@XL/wA)

```
Real time: 4.447 s
User time: 4.237 s
Sys. time: 0.205 s
CPU share: 99.90 %
Exit code: 0
```