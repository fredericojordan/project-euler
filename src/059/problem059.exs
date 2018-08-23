#!/usr/bin/env elixir
defmodule Problem059 do
  @moduledoc """
  Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

  A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

  For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

  Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

  Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
  """

  use Bitwise

  @lowercase_letters for n <- ?a..?z, do: << n :: utf8 >>

  defp read_encrypted_file() do
    {:ok, ascii_code_list} = File.read("p059_cipher.txt")

    ascii_code_list
    |> String.trim("\n")
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> to_string()
  end

  defp xor({a, b}), do: Bitwise.bxor(a, b)

  defp is_decrypted(message), do: String.contains?(message, " and ")

  defp decrypt(message, key), do: encrypt(message, key)

  defp encrypt(message, key) do
    message_charlist = String.to_charlist(message)

    key
    |> String.to_charlist()
    |> Stream.cycle()
    |> Enum.zip(message_charlist)
    |> Enum.map(&xor/1)
    |> to_string()
  end

  defp generate_keys() do
    for a <- @lowercase_letters,
        b <- @lowercase_letters,
        c <- @lowercase_letters,
        do:
          a <> b <> c
  end

  def solve do
    encrypted_message = read_encrypted_file()

    generate_keys()
    |> Stream.cycle()
    |> Stream.map(&(decrypt(encrypted_message, &1)))
    |> Stream.filter(&is_decrypted/1)
    |> Enum.take(1)
    |> List.first()
    |> String.to_charlist()
    |> Enum.sum()
  end
end

IO.puts Problem059.solve
