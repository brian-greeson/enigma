class CharacterSet

  def initialize
  @characters = default_set
  end

  def default_set
    ("a".."z").to_a << " "
  end

  def shift(starting_char, offset)
    return starting_char if !@characters.include?(starting_char)
    @characters.rotate(shift_amount(starting_char, offset)).first
  end

  def shift_amount(starting_char, offset)
    @characters.index(starting_char) + rotate_only_once(offset)
  end

  def rotate_only_once(offset)
    offset % @characters.size
  end

end
