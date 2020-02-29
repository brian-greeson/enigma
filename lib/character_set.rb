class CharacterSet
  def initialize(characters = nil)
  @characters = characters ? characters : default_set
  end

  def default_set
    ("a".."z").to_a << " "
  end

  def all_characters
    @characters
  end

end
