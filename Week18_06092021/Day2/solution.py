# initial import 
import hashlib 

# output sha256 hash in hexadecima string format
def hash(message):
	return hashlib.sha256(message).hexdigest()

sentence_one = b"The quick brown fox jumped over the lazy dog"
print(sentence_one, hash(sentence_one))

sentence_two = b"The quick brown fox jumped over the lazy dog"
print(sentence_two, hash(sentence_two))

payment_message = b"I agree to pay Joe $90"
print(payment_message, hash(payment_message))

payment_message_two = b"I agree to pay Joe $90"
print(payment_message_two, hash(payment_message_two))