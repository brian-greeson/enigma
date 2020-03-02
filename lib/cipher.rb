require_relative "character_set"
require_relative "message"

class Cipher
  attr_reader :character_set
  def initialize()
    @character_set = CharacterSet.new
  end

  def encrypt_file(plaintext_file, target_file)
    plaintext_file = File.open(plaintext_file, "r")
    encrypted = encrypt(plaintext_file.read)
    write_file(target_file, encrypted[:encryption])
    encrypted
  end

  def decrypt_file(ciphertext_file, target_file, key, date)
    ciphertext_file = File.open(ciphertext_file, "r")
    decrypted = decrypt(ciphertext_file.read, key, date)
    write_file(target_file, decrypted[:decryption])
    decrypted
  end

  def write_file(target_file, content)
    ciphertext_file = File.open(target_file, "w")
    ciphertext_file.write(content)
    ciphertext_file.close
  end
end
