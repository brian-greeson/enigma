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

  def test_it_knows_message_key
    text = mock
    message = Message.new(text, "01234")

    assert_equal "01234", message.key
  end

  def test_it_makes_a_new_key_when_not_given_one
    text = mock
    Random.stubs(:rand).returns(1234)
    message = Message.new(text)

    assert_equal "01234", message.key
  end

  def test_it_knows_date_of_message
    text = mock
    key = mock
    message = Message.new(text, key, "131299")

    assert_equal "131299", message.date
  end

  def test_it_uses_todays_date_when_not_given_date
    text = mock
    key = mock
    Date.stubs(:today).returns(Date.new(1999, 12, 13))
    message = Message.new(text, key)

    assert_equal "131299", message.date
  end

end
