require "./test/test_helper"
require "./lib/message.rb"

class Message < Minitest::Test

  def test_it_exists
    assert_instance_of Message, Message.new
  end

  def test_it_takes_a_string_message
    message = Message.new("Hello World. Get ready for tacos!")
    expected_message = "Hello World. Get ready for tacos!"
    assert_equal expected_message, message.text
  end

end
