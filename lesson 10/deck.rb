class Deck
  attr_reader :cards, :alternative_cards

  def initialize
    @cards = {}
    @alternative_cards = {}
    card = Card.new
    card.suits.each do |suit|
      card.cards_points.each do |one_card, points|
        @cards["#{one_card}#{suit}".to_sym] = points
      end

      card.cards_other_points.each do |one_card, points|
        @alternative_cards["#{one_card}#{suit}".to_sym] = points
      end
    end
  end
end
