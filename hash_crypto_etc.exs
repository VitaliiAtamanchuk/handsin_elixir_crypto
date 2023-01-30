defmodule CryptoExamples do
  import Bitwise

  def hash(msg) do
    :crypto.hash(:sha256, msg)
      |> Base.encode16
  end

  def salted_hash(salt, msg) do
    hash(msg <> salt)
  end

  def hmac(key, msg) do
    :crypto.mac(:hmac, :sha256, key, msg)
      |> Base.encode16
  end

  # constant time compare
  def compare?(a, b) when byte_size(a) != byte_size(b), do: false
  def compare?(a, b) when is_binary(a) and is_binary(b) do
    a_list = String.to_charlist(a)
    b_list = String.to_charlist(b)

    compare?(a_list, b_list)
  end
  def compare?(a, b) when is_list(a) and is_list(b) do
    result = Enum.zip(a, b)
      |> Enum.reduce(0, fn({i, j}, acc) -> acc ||| bxor(i, j) end)

    result == 0
  end
end
