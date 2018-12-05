class Controller
  def run
    puts "Input your name"
    name = gets.chomp

    user = User.new(name)
    dealer = Dealer.new
    cards = Cards.new
    bank = Bank.new

    start_game
  end

  def start_game
    user.money -= RATE
    dealer.money -= RATE
    bank.bank_money += RATE*2

    2.times take_card(user)
    2.times take_card(dealer)

    show_cards

    loop do
      puts '1.  Miss'
      puts '2.  Take card'
      puts '2.  Оpen cards'

      choice = gets.chomp

      case choice
      when '1'
        dealer_game
      when '2'
        add_card
      when '3'
        open_cards
      else
        puts 'You input wrong number'
      end
    end
  end

  def take_card(gamer)
    loop do
      card = cards[rand(cards.size)]
      unless user.used_cards(card) && dealer.used_cards(card)
        gamer.used_cards << card
        break
      end
    end
  end

  def show_cards
    puts "#{user.name} cards (points #{count_points(user)}): "
    user.used_cards.each { |card| print "#{card} " }

    puts "dealer cards: "
    dealer.used_cards.each { |card| print "* " }
  end

  def show_money
    puts "#{user.name} money #{user.money})"
    puts "dealer money #{dealer.money})"
  end

  def count_points(gamer)
    count = 0
    gamer.used_cards.each do |card|
      count += cards.cards[card]
    end

    return count if count > 21

    gamer.used_cards.each do |card|
      if count > 21 && cards.alternative_cards[card]
        count = count - cards.cards[card] + cards.alternative_cards[card]
      else
        return count
      end
    end
    count
  end

  def dealer_game
    take_card(dealer) if count_points(dealer) < 17
    if user.used_cards.size == 3 || dealer.used_cards == 3
      open_cards
    else
      show_cards
    end
  end

  def add_card
    take_card(user)
    dealer_game
  end

  def open_cards
    user_points = count_points(user)
    dealer_points = count_points(dealer)

    puts "#{user.name} cards (points #{user_points}): "
    user.used_cards.each { |card| print "#{card} " }

    puts "dealer cards (points #{dealer_points}): "
    dealer.used_cards.each { |card| print "#{card} " }

    count_money
    show_money
    ask_question
  end

  def take_money(gamer, money)
    gamer.money += money
  end

  def bank_zero
    bank.bank_money = 0
  end

  def count_money
    if user_points > 21 && dealer_points > 21
      take_money(user, bank.bank_money/2)
      take_money(dealer, bank.bank_money/2)
    elsif user_points > 21 && dealer_points <= 21
      take_money(dealer, bank.bank_money)
    elsif user_points <= 21 && dealer_points > 21
      take_money(user, bank.bank_money)
    elsif user_points > dealer_points
      take_money(user, bank.bank_money)
    else
      take_money(dealer, bank.bank_money)
    end
    bank_zero
  end

  def ask_question
    puts "Do you want to play once again? (Y/N)"
    choice = gets.chomp.downcase
    if choice == "y"
      start_game
    end
  end
end




