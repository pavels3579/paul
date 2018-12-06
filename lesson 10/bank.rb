class Bank
  RATE = 10

  attr_reader :rate
  attr_accessor :bank_money

  def initialize
    @bank_money = 0
    @rate = RATE
  end
end
