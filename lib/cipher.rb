require_relative "character_set"
require_relative "message"

class Cipher
  attr_reader :character_set
  def initialize()
    @character_set = CharacterSet.new
  end

end
