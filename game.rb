# frozen_string_literal: true

require_relative 'show'

class Game
  include Show
  def initialize
    @dealer = Dealer.new('Дилер')
    @user = create_user
    @players = [@user, @dealer]
    greeting(@user)
    start
  end

  private

  def start
    cleanup
    start_menu(@user)
    choise = gets.chomp
    case choise
    when 'y' || 'Y'
      con
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
    @players.each(&:cleanup_cards)
    @deck = Deck.new
    @bets = 0
  end

  def create_user
    puts 'Введите ваше имя:'
    User.new(gets.chomp.capitalize)
  rescue RuntimeError => e
    puts e.message
    retry
  end
  
  def con
  end

  def distribution(deck)
    2.times do
      @players.each { |player| player.take_card(deck) }
    end
  end
end
