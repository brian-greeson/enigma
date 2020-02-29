class Message
  attr_reader :message

  def initialize(message = nil)
    @message = message
  end

  def text
    @message
  end

end
