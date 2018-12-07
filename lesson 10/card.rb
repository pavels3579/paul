class Card
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

  attr_reader :suits, :cards_points, :cards_other_points

  def initialize
    @suits = SUITS
    @cards_points = CARDS_POINTS
    @cards_other_points = CARDS_OTHER_POINTS
  end
end
