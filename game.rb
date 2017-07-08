# frozen_string_literal: true

require_relative 'show'

class Game
  ACTIONS = { 1 => :dealer_hit, 2 => :user_hit, 3 => :open_cards }.freeze
  BANK = 100
  BET = 10

  include Show

  def initialize
    @dealer = Dealer.new('Дилер', BANK)
    @user = create_user
    @players = [@user, @dealer]
    @deck = Deck.new
    @bets = 0
    greeting(@user)
    start
  end

  private

  def betting(bet)
    @players.each { |player| @bets += player.give_money!(bet) }
  rescue RuntimeError => e
    puts e.message
  end

  def check_cards
    open_cards if @user.cards.size == 3 && @dealer.cards.size == 3
  end

  def cleanup
    @bets = 0
    @deck = Deck.new
    @players.each(&:cleanup_cards)
  end

  def choice_actions(player)
    show_actions(player)
    show_choice(choice = gets.chomp.to_i)
    send(ACTIONS[choice])
  end

  def con
    check_cards
    show_cards(@user)
    hide_cards(@dealer)
    choice_actions(@user)
  rescue RuntimeError
    puts "#{@dealer.name} пропускает ход."
    line
    con
  end

  def create_user
    puts 'Введите ваше имя:'
    Player.new(gets.chomp.capitalize, BANK)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def dealer_hit
    hit(@dealer)
    con
  end

  def determine_winner
    if @user.score > 21 || (@user.score <= 21 && @dealer.score > @user.score)
      @dealer
    else
      @user
    end
  end

  def distribution(deck)
    @players.each { |player| player.take_card(deck) }
  end

  def hit(player)
    puts "Ход #{player.name}"
    player.take_card(@deck)
    puts "#{player.name} взял карту."
    line
  end

  def open_cards
    end_con
    @players.each { |player| show_cards(player) }
    winner = determine_winner
    show_winner(winner)
    winner.take_money(@bets)
    start
  end

  def start
    start_menu(@user)
    choise = gets.chomp
    case choise
    when 'y'
      new_con
      start_con
    else
      puts 'Выход.'
      exit
    end
  end

  def start_con
    cleanup
    2.times { distribution(@deck) }
    betting(BET)
    con
  end

  def user_hit
    if @user.cards.size < 3
      hit(@user)
    else
      puts 'У вас уже 3 карты.'
      choice_actions(@user)
    end
    dealer_hit
  end
end
