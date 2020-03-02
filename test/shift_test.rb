require "./test/test_helper"
require "./lib/shift"

class ShiftTest < Minitest::Test

  def test_it_exists
    assert_instance_of Shift, Shift.new("01234", "011399")
  end

  def test_it_can_generate_key_offsets
    shift = Shift.new("02715", "040895")
    date_squared = "040895".to_i ** 2
    key = "02715"
    assert_equal  3, shift.offset_a(key, date_squared)
    assert_equal 27, shift.offset_b(key, date_squared)
    assert_equal 73, shift.offset_c(key, date_squared)
    assert_equal 20, shift.offset_d(key, date_squared)
  end

  def test_it_can_give_all_the_offsets_for_encryption
    shift = Shift.new("02715", "040895")

    assert_equal [3,27,73,20], shift.all
  end

  def test_it_can_give_all_the_offsets_for_decryption
    shift = Shift.new("02715", "040895", :decrypt)

    assert_equal [-3,-27,-73,-20], shift.all

  end
end
