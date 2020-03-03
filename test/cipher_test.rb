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

  def test_it_can_write_a_file
    result_file = "./test/fixtures/results/write_results.txt"
    cipher = Cipher.new
    cipher.write_file("./test/fixtures/results/write_results.txt", "hello world")
    results = File.open(result_file, "r").read

    assert_equal "hello world", results
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
