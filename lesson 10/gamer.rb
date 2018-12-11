class Gamer
  START_MONEY = 100

  attr_accessor :money, :used_cards

  def initialize
    @money = START_MONEY
    @used_cards = []
  end

  def count_points
    count = 0
    used_cards.each do |card|
      count += card.points
    end

    return count if count <= 21

    used_cards.each do |card|
      count = count - card.points + card.other_points if count > 21 && !card.other_points.nil?
    end
    count
  end
end
