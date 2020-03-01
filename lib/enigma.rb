require_relative "cipher"
require_relative "shift"
class Enigma < Cipher

  def encrypt(text, key, date)
    plaintext = Message.new(text, key, date)
    ciphertext = Message.new("", key, date)
    offsets = Shift.new(key, plaintext.date)

    plaintext.text.chars.each_slice(4) do |characters|
     ciphertext.text << encrypt_chars(characters, offsets).join
    end
    
    {encryption: ciphertext.text, key: ciphertext.key, date: ciphertext.date}
  end

  def encrypt_chars(plaintext_chars, offsets)
    plaintext_chars.reduce([]) do |ciphertext, character|
      ciphertext << @character_set.shift(character, offsets.all[ciphertext.size])
      ciphertext
    end
  end

end
