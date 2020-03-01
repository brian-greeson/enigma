require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def test_it_exists
    assert_instance_of Enigma, Enigma.new
  end

  def test_it_can_encypt_a_message
    skip
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_shift_chars
    enigma = Enigma.new
    offsets = mock
    offsets.stubs(:offset_a).returns(1)
    offsets.stubs(:offset_b).returns(1)
    offsets.stubs(:offset_c).returns(1)
    offsets.stubs(:offset_d).returns(1)

    assert_equal ["b","c","d","e"], enigma.encypt_chars(["a","b","c","d"], offsets)

  end

  # def test_it_can_decrypt_a_message
  #   enigma = Enigma.new
  #   expected = {
  #               decryption: "hello world",
  #               key: "02715",
  #               date: "040895"
  #              }
  #   assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  # end

end
