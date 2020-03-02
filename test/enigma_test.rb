require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def test_it_exists
    assert_instance_of Enigma, Enigma.new
  end

  def test_it_can_encrypt_a_message
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_transcode_chars
    enigma = Enigma.new
    offsets = mock
    offsets.stubs(:all).returns([1,2,3,4])

    assert_equal ["b","d","f","h"], enigma.transcode_chars(["a","b","c","d"], offsets)
    assert_equal ["y"," ","b"], enigma.transcode_chars(["x","y","z"], offsets)
  end

  def test_it_can_transcode_messages
    enigma = Enigma.new
    plaintext_message  = Message.new("hello world", "02715", "040895" )
    ciphertext_message = Message.new("keder ohulw", "02715", "040895" )

    encrypt_result =  enigma.transcode_message(plaintext_message, :encrypt)
    assert_equal ciphertext_message.text, encrypt_result.text

    decrypt_result = enigma.transcode_message(ciphertext_message, :decrypt)
    assert_equal plaintext_message.text, decrypt_result.text
  end
end
