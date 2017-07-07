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

  def cleanup
    @bets = 0
    @deck = Deck.new
    @players.each(&:cleanup_cards)
  end

  def con
  end

  def create_user
    puts 'Введите ваше имя:'
    User.new(gets.chomp.capitalize)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def distribution(deck)
    2.times do
      @players.each { |player| player.take_card(deck) }
    end
  end
  
  def start_con
    cleanup
    distribution(@deck)
    betting(BET)
    show_cards(@user)
    hide_cards(@dealer)
    con
  end
end
