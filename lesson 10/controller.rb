class Controller
  def run
    @view = View.new

    name = @view.input_name

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
    @bank.money += @bank.rate * 2

    2.times { take_card(@user) }
    2.times { take_card(@dealer) }

    show_cards

    loop do
      choice = @view.input_action

      case choice
      when '1'
        dealer_game
      when '2'
        add_card
      when '3'
        open_cards
      else
        @view.message_wrong_number
      end
    end
  end

  def take_card(gamer)
    gamer.used_cards << @deck.delete
  end

  def show_cards
    @view.show_title_user_cards(@user, @user.count_points)
    @user.used_cards.each { |card| @view.show_card(card) }
    @view.show_empty_string

    @view.show_title_dealer_cards
    @dealer.used_cards.each { |_card| @view.show_dealer_skipped_card }
    @view.show_empty_string
  end

  def show_money
    @view.show_money(@user, @dealer)
  end

  def dealer_game
    take_card(@dealer) if @dealer.count_points < 17
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
    user_points = @user.count_points
    dealer_points = @dealer.count_points

    @view.show_title_user_cards(@user, user_points)
    @user.used_cards.each { |card| @view.show_card(card) }
    @view.show_empty_string

    @view.show_title_dealer_cards(dealer_points)
    @dealer.used_cards.each { |card| @view.show_card(card) }
    @view.show_empty_string

    count_money(user_points, dealer_points)
    show_money
    ask_question
  end

  def take_money(gamer, money)
    gamer.money += money
  end

  def bank_zero
    @bank.money = 0
  end

  def count_money(user_points, dealer_points)
    if user_points > 21 && dealer_points > 21
      take_money(@user, @bank.money / 2)
      take_money(@dealer, @bank.money / 2)
    elsif user_points > 21 && dealer_points <= 21
      take_money(@dealer, @bank.money)
    elsif user_points <= 21 && dealer_points > 21
      take_money(@user, @bank.money)
    elsif user_points == dealer_points
      take_money(@user, @bank.money / 2)
      take_money(@dealer, @bank.money / 2)
    elsif user_points > dealer_points
      take_money(@user, @bank.money)
    else
      take_money(@dealer, @bank.money)
    end
    bank_zero
  end

  def ask_question
    choice = @view.offer_play_again
    start_game if choice == 'y'
    abort
  end
end
