class Message
  attr_reader :message

  def initialize(message = nil)
    @message_text= message if message.is_a?(String)
    @message_text = message[:text] if message.is_a?(Hash)
  end

  def text
    @message_text
  end

end
