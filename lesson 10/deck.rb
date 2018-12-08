class Deck
  SUITS = ['+', '<3', '^', '<>'].freeze
  CARDS_POINTS = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'V' => 10,
    'D' => 10,
    'K' => 10,
    'T' => 11
  }.freeze

  CARDS_OTHER_POINTS = {
    'T' => 1
  }.freeze

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      CARDS_POINTS.each do |name_card, points|
        other_points = CARDS_OTHER_POINTS[name_card]
        card = Card.new(suit, name_card, points, other_points)
        @cards << card
      end
    end
  end
end
