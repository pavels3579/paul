class View
  def input_name
    puts 'Input your name'
    gets.chomp
  end

  def input_action
    puts '1.  Miss'
    puts '2.  Take card'
    puts '3.  Оpen cards'

    gets.chomp
  end

  def show_title_user_cards(user, points)
    puts "#{user.name} cards (#{points} points): "
  end

  def show_title_dealer_cards(points = nil)
    if points.nil?
      puts 'dealer cards: '
    else
      puts "dealer cards (#{points} points): "
    end
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

  def show_money(user, dealer)
    puts "#{user.name} money #{user.money}"
    puts "dealer money #{dealer.money}"
  end

  def message_wrong_number
    puts 'You inputed wrong number'
  end

  def offer_play_again
    puts 'Do you want to play once again? (Y/N)'
    gets.chomp.downcase
  end
end
