import hashlib

# output sha256 hash in hexadecimal string format
def hash(message):
    return hashlib.sha256(message).hexdigest()

# modify these messages
# note: we include the "b" before the string definition in order to represent it as bytes instead of a string
message_one = b"I came home to 500 BTC"

message_two = b"I came home to 500 BTC"

# print both messages and their corresponding hashes
print(message_one, hash(message_one))
print(message_two, hash(message_two))

# compare the hashes in an if/else statement

hash_one = hash(message_one)

hash_two = hash(message_two)

if (message_one):
    print(hash_one)
else:
    print(hash_two)

# compare the length of the hashes

print(f"Length of Hash_One is {len(hash_one)}")
print(f"Length of Hash_Two is {len(hash_two)}")


# modify these messages
# note: we include the "b" before the string definition in order to represent it as bytes instead of a string
message_new_one = b"I came home to 700 BTC"

message_new_two = b"I came home to 500 BTC, 200 ETH, and 1000 ADA"

# print both messages and their corresponding hashes
print(message_new_one, hash(message_new_one))
print(message_new_two, hash(message_new_two))

# compare the hashes in an if/else statement

hash_new_one = hash(message_new_one)

hash_new_two = hash(message_new_two)

if (message_new_one):
    print(hash_new_one)
else:
    print(hash_new_two)

# compare the length of the hashes

print(f"Length of Hash_New_One is {len(hash_new_one)}")
print(f"Length of Hash_New_Two is {len(hash_new_two)}")