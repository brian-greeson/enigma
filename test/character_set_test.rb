require "minitest/autorun"

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
    assert_equal expected_characters, charater_set.all
  end

  def test_it_takes_custom_character_sets
    charater_set = CharacterSet,new(["g", "5", "R", "w"])

    assert_equal ["g", "5", "R", "w"], charater_set.all
  end

end
