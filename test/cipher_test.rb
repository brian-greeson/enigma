require "./test/test_helper"
require "./lib/cipher"

class CipherTest < Minitest::Test

  def test_it_exists
    assert_instance_of Cipher, Cipher.new
  end

  def test_it_has_a_character_set
    cipher = Cipher.new

    assert_instance_of CharacterSet, cipher.character_set
  end

  def test_it_encypts_a_message
    cipher = Cipher.new
    message = Message.new

    assert_instance_of Message, cipher.encypt(message)
  end

  def test_it_decrypts_a_message
    cipher = Cipher.new
    message = Message.new

    assert_instance_of Message, cipher.decypt(message)
  end

end
