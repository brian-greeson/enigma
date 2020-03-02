require "./test/test_helper"
require "./lib/shift"

class ShiftTest < Minitest::Test

  def test_it_exists
    assert_instance_of Shift, Shift.new("01234", "011399")
  end

  def test_it_can_generate_key_offsets
    shift = Shift.new("02715", "040895")

    assert_equal  3, shift.shift_a
    assert_equal 27, shift.shift_b
    assert_equal 73, shift.shift_c
    assert_equal 20, shift.shift_d
  end

  def test_it_can_give_all_the_offsets_for_encryption
    shift = Shift.new("02715", "040895")

    assert_equal [3,27,73,20], shift.all
  end

  def test_it_can_give_all_the_offsets_for_decryption
    shift = Shift.new("02715", "040895", :decrypt)

    assert_equal [-3,-27,-73,-20], shift.all
  end

  def test_it_calcs_date_seed
    shift = Shift.new("02715", "040895")

    assert_equal 1672401025, shift.date_squared
  end

  def test_it_knows_keys_a_d
    shift = Shift.new("02715", "040895")

    assert_equal 2, shift.key_a
    assert_equal 27, shift.key_b
    assert_equal 71, shift.key_c
    assert_equal 15, shift.key_d
  end

  def test_it_knows_date_offsets_a_d
    shift = Shift.new("02715", "040895")

    assert_equal 1, shift.date_offset_a
    assert_equal 0, shift.date_offset_b
    assert_equal 2, shift.date_offset_c
    assert_equal 5, shift.date_offset_d
  end
end
