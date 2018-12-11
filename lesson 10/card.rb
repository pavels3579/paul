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

  attr_accessor :suit, :name, :points, :other_points

  def initialize(suit, name, points, other_points)
    @suit = suit
    @name = name
    @points = points
    @other_points = other_points
  end
end
