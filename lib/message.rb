class Message
  attr_reader :text, :date

  def initialize(message = nil, date = Date.today)
    if message.is_a?(Hash)
      @text = message[:text]
      @date = message.has_key?(:date) ? message[:date] : date
    else
      @date = date
      @text = message
    end
  end

end
