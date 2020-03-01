require "./test/test_helper"
require "./lib/message"

class MessageTest < Minitest::Test

  def test_it_exists
    assert_instance_of Message, Message.new
  end

  def test_it_can_take_a_string_message
    expected_message = "Hello World. Get ready for tacos!"
    message = Message.new(expected_message)

    assert_equal expected_message, message.text
  end

  def test_it_can_take_a_hash_message
    expected_message = "Hello World. Get ready for tacos!"
    message = Message.new({text: expected_message})

    assert_equal expected_message, message.text
  end

end
