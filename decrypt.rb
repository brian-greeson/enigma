require "./lib/enigma"

plaintext_filename, ciphertext_filename, key, date = ARGV

enigma = Enigma.new

decrypted = enigma.decrypt_file(plaintext_filename, ciphertext_filename, key, date)
puts "Created #{plaintext_filename} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
