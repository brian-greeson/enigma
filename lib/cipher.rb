require_relative "character_set"
require_relative "message"

class Cipher

  attr_reader :character_set

  def initialize()
    @character_set = CharacterSet.new
  end

  def transcode_file(files = {}, message_details = {}, direction)
    source_text = File.open(files[:source], "r")
    message = Message.new(source_text.read, message_details[:key], message_details[:date])
    write_file(files[:target], transcode_message(message, direction).text)
    message
  end

  def write_file(target_file, content)
    ciphertext_file = File.open(target_file, "w")
    ciphertext_file.write(content)
    ciphertext_file.close
  end

end
