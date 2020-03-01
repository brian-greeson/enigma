class Message
  attr_reader :text, :key, :date

  def initialize(message = nil, key = nil, date = nil)
    @text = message
    @key  = key ? key : make_key
    @date = date ? date : todays_date
  end

  def make_key
    Random.rand(99999).to_s.rjust(5,"0")
  end

  def todays_date

  end


end
