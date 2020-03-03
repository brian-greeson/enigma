# ruby encrypt.rb test/fixtures/plaintext.txt test/fixtures/results/ciphertext.txt 02715 040895
require "./lib/enigma"

files = {}
message_info = {}

files[:source], files[:target], message_info[:key], message_info[:date] = ARGV

enigma = Enigma.new

encrypted = enigma.transcode_file(files, message_info, :encrypt)
puts "Created #{files[:target]} with the key #{encrypted.key} and date #{encrypted.date}"
