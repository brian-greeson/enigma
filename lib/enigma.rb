require "date"
require_relative "cipher"
require_relative "shift"

class Enigma < Cipher

  def encrypt(text = nil, key = nil, date = nil)
    encrypted_message = transcode_message(Message.new(text, key, date), :encrypt)
    {
      encryption: encrypted_message.text,
      key: encrypted_message.key,
      date: encrypted_message.date
    }
  end

  def decrypt(text = nil, key = nil, date = nil)
    decrypted_message = transcode_message(Message.new(text, key, date), :decrypt)
    {
      decryption: decrypted_message.text,
      key: decrypted_message.key,
      date: decrypted_message.date
    }
  end

  def transcode_message(message, direction)
    offsets = Shift.new(message.key, message.date, direction)
    transcoded_message = Message.new("", message.key, message.date)

    message.text.chars.each_slice(offsets.all.size) do |characters|
     transcoded_message.text << transcode_chars(characters, offsets).join
    end

    transcoded_message
  end

  def transcode_chars(characters, offsets)
    characters.reduce([]) do |shifted_chars, character|
      shifted_chars << @character_set.shift(character, offsets.all[shifted_chars.size])
      shifted_chars
    end
  end

end
