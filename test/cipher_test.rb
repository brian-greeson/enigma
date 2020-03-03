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

  def test_it_can_transcode_files
    enigma = Enigma.new

    files = {
              source: "./test/fixtures/plaintext.txt",
              target: "./test/fixtures/results/ciphertext.txt"
            }
    settings = {
                key: "02715",
                date: "040895"
               }
    enigma.transcode_file(files, settings, :encrypt)
    result = File.open(files[:target], "r").read.chomp

    assert_equal "keder ohulw!", result

    files = {
              source: "./test/fixtures/ciphertext.txt",
              target: "./test/fixtures/results/plaintext.txt"
            }
    settings = {
                key: "02715",
                date: "040895"
               }

    enigma.transcode_file(files, settings, :decrypt)
    result = File.open(files[:target], "r").read.chomp
    
    assert_equal "hello world!", result
  end

end
