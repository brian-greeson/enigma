# ruby decrypt.rb test/fixtures/ciphertext.txt test/fixtures/results/plaintext.txt 02715 040895
require "./lib/enigma"

files = {}
message_info = {}

files[:source], files[:target], message_info[:key], message_info[:date] = ARGV

enigma = Enigma.new

decrypted = enigma.transcode_file(files, message_info, :decrypt)
puts "Created #{files[:target]} with the key #{decrypted.key} and date #{decrypted.date}"
