require "./lib/enigma"

plaintext_filename, ciphertext_filename = ARGV

enigma = Enigma.new

encrypted = enigma.encrypt_file(plaintext_filename, ciphertext_filename)
puts "Created #{ciphertext_filename} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
