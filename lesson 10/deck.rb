class Deck
  attr_reader :cards

  def initialize
    @cards = Card::SUITS.each.with_object([]) do |suit, cards|
      Card::CARDS_POINTS.each do |name_card, points|
        other_points = Card::CARDS_OTHER_POINTS[name_card]
        card = Card.new(suit, name_card, points, other_points)
        cards << card
      end
    end.shuffle!
  end

  def delete
    cards.pop
  end
end
