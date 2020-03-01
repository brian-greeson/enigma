require_relative "character_set"
require_relative "Message"

class Cipher
  attr_reader :character_set

  def initialize()
    @character_set = CharacterSet.new
  end

  def encypt(message)
    message
  end

  def decypt(message)
    message
  end
end
