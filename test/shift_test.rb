require "./test/test_helper"
require "./lib/shift"

class ShiftTest < Minitest::Test

  def test_it_exists
    assert_instance_of Shift, Shift.new("01234", "011399")
  end

  def test_it_can_generate_key_offsets
    shift = Shift.new("02715", "040895")

    assert_equal  3, shift.offset_a
    assert_equal 27, shift.offset_b
    assert_equal 73, shift.offset_c
    assert_equal 20, shift.offset_d
  end

end
