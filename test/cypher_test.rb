require "minitest/autorun"

class CypherTest < Minitest::Test

  def test_it_exists
    assert_instance_of Cypher, Cypher.new
  end

  def test_it_has_a_charater_set
    cypher = Cypher.new

    assert_instance_of CharaterSet, cypher.charater_set
  end

  def test_it_encypts_a_message
    cypher = Cypher.new
    message = Message.new({message: "Lorem ipsum"})

    assert_instance_of Message, cypher.encypt(message)
  end

  def test_it_decrypts_a_message
    cypher = Cypher.new
    message = Message.new({message: "Lorem ipsum"})

    assert_instance_of Message, cypher.dencypt(message)
  end

end
