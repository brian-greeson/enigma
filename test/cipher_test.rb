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

  def test_it_can_encrypt_a_file
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

  def test_it_can_decrypt_a_file
    cipher = Cipher.new
    cipher.stubs(:decrypt).returns({decryption: "hello world!"})
    source_filename = "./test/fixtures/plaintext.txt"
    target_filename = "./test/fixtures/results/ciphertext.txt"

    expected = "hello world!"
    results_file = File.open(target_filename, "r")
    results = results_file.read
    cipher.decrypt_file(source_filename, target_filename, "12345", "131299")

    assert_equal expected, results
  end

end
