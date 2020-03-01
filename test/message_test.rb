require "./test/test_helper"
require "./lib/message"

class MessageTest < Minitest::Test

  def test_it_exists
    assert_instance_of Message, Message.new
  end

  def test_it_has_attributes
    message = Message.new(
                          "Hello World. Get ready for tacos!",
                          "01234",
                          "131299"
                          )

    assert_equal "Hello World. Get ready for tacos!", message.text
    assert_equal "01234", message.key
    assert_equal "131299", message.date
  end

  def test_it_makes_a_new_key_when_not_given_one
    Random.stubs(:rand).returns(1234)
    message = Message.new

    assert_equal "01234", message.key
  end

  def test_it_uses_todays_date_when_not_given_date
    text, key = mock
    Date.stubs(:today).returns(Date.new(1999, 12, 13))
    message = Message.new(text, key)

    assert_equal "131299", message.date
  end

end
