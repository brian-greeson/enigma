class CharacterSet

  def initialize
  @characters = default_set
  end

  def default_set
    ("a".."z").to_a << " "
  end

  def shift(starting_char, shift_amount)
    @characters.rotate(@characters.index(starting_char) + shift_amount).first
  end

end
