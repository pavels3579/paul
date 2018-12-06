class Controller
  def run
    puts 'Input your name'
    name = gets.chomp

    @user = User.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new

    start_game
  end

  def start_game
    @user.used_cards = []
    @dealer.used_cards = []
    @user.money -= @bank.rate
    @dealer.money -= @bank.rate
    @bank.bank_money += @bank.rate * 2

    2.times { take_card(@user) }
    2.times { take_card(@dealer) }

    show_cards

    loop do
      puts '1.  Miss'
      puts '2.  Take card'
      puts '3.  Оpen cards'

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
      card = @deck.cards.keys[rand(@deck.cards.size)]
      unless @user.used_cards.include?(card) && @dealer.used_cards.include?(card)
        gamer.used_cards << card
        break
      end
    end
  end

  def show_cards
    puts "#{@user.name} cards (#{count_points(@user)} points): "
    @user.used_cards.each { |card| print "#{card} " }
    puts ''

    puts 'dealer cards: '
    @dealer.used_cards.each { |_card| print '* ' }
    puts ''
  end

  def show_money
    puts "#{@user.name} money #{@user.money}"
    puts "dealer money #{@dealer.money}"
  end

  def count_points(gamer)
    count = 0
    gamer.used_cards.each do |card|
      count += @deck.cards[card]
    end

    return count if count > 21

    gamer.used_cards.each do |card|
      if count > 21 && deck.alternative_cards[card]
        count = count - deck.cards[card] + deck.alternative_cards[card]
      else
        return count
      end
    end
    count
  end

  def dealer_game
    take_card(@dealer) if count_points(@dealer) < 17
    if @user.used_cards.size == 3 || @dealer.used_cards.size == 3
      open_cards
    else
      show_cards
    end
  end

  def add_card
    take_card(@user)
    dealer_game
  end

  def open_cards
    user_points = count_points(@user)
    dealer_points = count_points(@dealer)

    puts "#{@user.name} cards (#{user_points} points): "
    @user.used_cards.each { |card| print "#{card} " }
    puts ''

    puts "dealer cards (#{dealer_points} points): "
    @dealer.used_cards.each { |card| print "#{card} " }
    puts ''

    count_money(user_points, dealer_points)
    show_money
    ask_question
  end

  def take_money(gamer, money)
    gamer.money += money
  end

  def bank_zero
    @bank.bank_money = 0
  end

  def count_money(user_points, dealer_points)
    if user_points > 21 && dealer_points > 21
      take_money(@user, @bank.bank_money / 2)
      take_money(@dealer, @bank.bank_money / 2)
    elsif user_points > 21 && dealer_points <= 21
      take_money(@dealer, @bank.bank_money)
    elsif user_points <= 21 && dealer_points > 21
      take_money(@user, @bank.bank_money)
    elsif user_points == dealer_points
      take_money(@user, @bank.bank_money / 2)
      take_money(@dealer, @bank.bank_money / 2)
    elsif user_points > dealer_points
      take_money(@user, @bank.bank_money)
    else
      take_money(@dealer, @bank.bank_money)
    end
    bank_zero
  end

  def ask_question
    puts 'Do you want to play once again? (Y/N)'
    choice = gets.chomp.downcase
    start_game if choice == 'y'
    abort
  end
end
