class Bank
  RATE = 10

  attr_reader :rate
  attr_accessor :money

  def initialize
    @money = 0
    @rate = RATE
  end
end
