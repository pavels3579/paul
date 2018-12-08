class View
  attr_reader :input_name, :input_action, :show_dealer_skipped_card,
              :show_card, :show_empty_string, :show_title_dealer_cards,
              :show_title_user_cards

  def input_name
    puts 'Input your name'
    name = gets.chomp
  end

  def input_action
    puts '1.  Miss'
    puts '2.  Take card'
    puts '3.  Оpen cards'

    choice = gets.chomp
  end

  def show_cards(user, dealer, user_points)
    puts "#{@user.name} cards (#{user_points} points): "
    user.used_cards.each { |card| print "#{card.name}#{card.suit} " }
    puts ''

    puts 'dealer cards: '
    dealer.used_cards.each { |_card| print '* ' }
    puts ''
  end

  def show_title_user_cards(user, points)
    puts "#{user.name} cards (#{points} points): "
  end

  def show_title_dealer_cards
    puts 'dealer cards: '
  end

  def show_card(card)
    print "#{card.name}#{card.suit} "
  end

  def show_dealer_skipped_card
    print '* '
  end

  def show_empty_string
    puts ''
  end

end
