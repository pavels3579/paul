class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::CARDS_POINTS.each do |name_card, points|
        other_points = Card::CARDS_OTHER_POINTS[name_card]
        card = Card.new(suit, name_card, points, other_points)
        @cards << card
      end
    end
  end
end
