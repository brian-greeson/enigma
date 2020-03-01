require "./test/test_helper"
require "./lib/message"

class MessageTest < Minitest::Test

  def test_it_exists
    assert_instance_of Message, Message.new
  end

  def test_it_knows_message_text
    expected_message = "Hello World. Get ready for tacos!"
    message = Message.new(expected_message)

    assert_equal expected_message, message.text
  end


  def test_it_knows_date_of_message
    expected_message = "Hello World. Get ready for tacos!"
    message1 = Message.new(expected_message)

    assert_equal Date.today, message1.date

    expected_date = Date.new(1999,12,13)
    message2 = Message.new(expected_message, expected_date)

    assert_equal expected_date, message2.date

  end

end
