class Card
  attr_accessor :suit, :name, :points, :other_points

  def initialize(suit, name, points, other_points)
    @suit = suit
    @name = name
    @points = points
    @other_points = other_points
  end
end
