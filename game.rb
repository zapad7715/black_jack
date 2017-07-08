# frozen_string_literal: true

require_relative 'show'

class Game
  BET = 10

  include Show

  def initialize
    @dealer = Dealer.new('Дилер')
    @user = create_user
    @players = [@user, @dealer]
    @deck = Deck.new
    @bets = 0
    greeting(@user)
    start
  end

  private

  def start
    start_menu(@user)
    choise = gets.chomp
    case choise
    when 'y'
      puts ''
      puts 'Начинаем новый кон.'
      line
      start_con
    else
      puts 'Выход.'
      exit
    end
  end

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

  def con
    check_cards
    show_cards(@user)
    hide_cards(@dealer)
    show_actions(@user)
    show_choice(choice = gets.chomp.to_i)
    case choice
    when 1 then dealer_hit
    when 2 then user_hit
    when 3 then open_cards
    end
  rescue RuntimeError
    puts "#{@dealer.name} пропускает ход."
    line
    con
  end

  def create_user
    puts 'Введите ваше имя:'
    User.new(gets.chomp.capitalize)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def dealer_hit
    puts "Ход #{@dealer.name}"
    @dealer.take_card(@deck)
    puts "#{@dealer.name} взял карту."
    line
    con
  end

  def distribution(deck)
    2.times do
      @players.each { |player| player.take_card(deck) }
    end
  end

  def open_cards
    puts 'Кон окончен.'
    line
    @players.each { |player| show_cards(player) }
    start
  end

  def start_con
    cleanup
    distribution(@deck)
    betting(BET)
    con
  end

  def user_hit
    if @user.cards.size < 3
      puts 'Ваш ход.'
      @user.take_card(@deck)
      puts "Ваша карта: #{@user.cards.last}."
    else
      puts 'У вас уже 3 карты.'
    end
    line
    dealer_hit
  end
end
