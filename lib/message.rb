class Message
  attr_reader :text, :date

  def initialize(message = nil, date = Date.today)
      @date = date
      @text = message
  end

end
