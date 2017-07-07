# frozen_string_literal: true

require_relative 'show'

class Game
  include Show
  def initialize
    @dealer = Dealer.new
    @user = create_user
    @players = [@user, @dealer]
    @deck = Deck.new
    @bets = 0
    distribution(@deck)
    betting(10)
  end

  private

  def betting(bet)
    @players.map { |player| @bets += player.give_money!(bet) }
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
    2.times { @player.take_card(deck) }
    2.times { @dealer.take_card(deck) }
  end

  def reset_deck
    @deck = Deck.new
  end
end
