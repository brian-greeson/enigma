require "./test/test_helper"
require "./lib/character_set"

class CharacterSetTest < Minitest::Test

  def test_it_exists
    assert_instance_of CharacterSet, CharacterSet.new
  end

  def test_it_has_default_characture_set
    charater_set = CharacterSet.new
    expected_characters = [
                            "a", "b", "c", "d", "e", "f", "g", "h",
                            "i", "j", "k", "l", "m", "n", "o", "p",
                            "q", "r", "s", "t", "u", "v", "w", "x",
                            "y", "z", " "
                          ]
    assert_equal expected_characters, charater_set.default_set
  end

  def test_it_can_rotate_the_set
    character_set = CharacterSet.new

    assert_equal "b", character_set.shift("a", 1)
    assert_equal "d", character_set.shift("b", 2)
    assert_equal "a", character_set.shift("z", 2)
    assert_equal "d", character_set.shift("d", 27)
  end

end
