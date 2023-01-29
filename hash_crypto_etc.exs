msg = "Text"
salt = "Salt"
key = "Key"

IO.puts msg

hash = :crypto.hash(:sha256, msg)
  |> Base.encode16
IO.puts hash

salted_hash = :crypto.hash(:sha256, msg <> salt)
  |> Base.encode16
IO.puts salted_hash

signature = :crypto.mac(:hmac, :sha256, key, msg)
  |> Base.encode16
IO.puts signature
