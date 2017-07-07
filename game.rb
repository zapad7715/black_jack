# frozen_string_literal: true

require_relative 'show'

class Game
  include Show
  def initialize
    @dealer = Dealer.new('Дилер')
    @user = create_user
    @players = [@user, @dealer]
    new_round
  end

  def new_round
    @players.each(&:cleanup_cards)
    @deck = Deck.new
    @bets = 0
    distribution(@deck)
    betting(10)
  end

  private

  def betting(bet)
    @players.each { |player| @bets += player.give_money!(bet) }
  rescue RuntimeError => e
    puts e.message
  end

  def create_user
    puts 'Введите ваше имя: '
    User.new(gets.chomp)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def distribution(deck)
    2.times do
      @players.each { |player| player.take_card(deck) }
    end
  end
end
