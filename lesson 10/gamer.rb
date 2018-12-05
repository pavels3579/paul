class Gamer
  START_MONEY = 100

  attr_reader :money

  def initialize
    @money = START_MONEY
    @used_cards = []
  end

end
