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
    cipher = Cipher.new
    cipher.stubs(:encrypt).returns({encryption: "hello world!"})
    source_filename = "./test/fixtures/plaintext.txt"
    target_filename = "./test/fixtures/results/ciphertext.txt"

    expected = "hello world!"
    results_file = File.open(target_filename, "r")
    results = results_file.read
    cipher.encrypt_file(source_filename, target_filename)

    assert_equal expected, results
  end

  def test_it_can_read_a_file
    cipher = Cipher.new

    source_filename = "./test/fixtures/ciphertext.txt"
    target_filename = "./test/fixtures/results/plaintext.txt"

  end

end
