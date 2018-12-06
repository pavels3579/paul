class Gamer
  START_MONEY = 100

  attr_accessor :money, :used_cards

  def initialize
    @money = START_MONEY
    @used_cards = []
  end
end
